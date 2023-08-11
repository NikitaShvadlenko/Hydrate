import Foundation
import CoreData

final class MainScreenInteractor {
    weak var presenter: MainScreenInteractorOutput?
    var context: NSManagedObjectContext?
}

// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
    func retrieveUserData() {
        let fetchRequest = UserData.sortedFetchRequest
        do {
            let userData = try context?.fetch(fetchRequest)
            guard let userData = userData?.first else {
                presenter?.interactorFailedToRetrieveUserData(self)
                return
            }
            presenter?.interactor(self, didRetrieveUserData: userData)
        } catch {
            fatalError("Failed to perform fetch request")
        }
    }

    func insertJournalEntry(beverage: Beverage, volumeConsumed: Int) {
        guard let context = context else {
            fatalError("Context")
        }

        let dailyJournal = DailyJournal.currentDaysJournal(context: context)
        JournalEntry.insert(into: context, in: dailyJournal, beverage: beverage, consumed: volumeConsumed)
        // TODO: check if there is a reason for moving to main here
        // Why is there beverage name?
        DispatchQueue.main.async {
            self.presenter?.interactor(self, didInsertJournalEntry: beverage.name)
        }
    }

    func retriveShortcuts() {
        let shortcuts = fetchAllShortcuts()
        presenter?.interactor(self, didRetrieveShortcuts: shortcuts)
    }

    func retrieveHydrationData() {
        guard let context = context else {
            fatalError("Context not set")
        }
        let dailyJournal = DailyJournal.currentDaysJournal(context: context)
        updateDailyGoalIfNeeded(for: dailyJournal)
            let journalEntries = dailyJournal.journalEntries
            var volumeConsumed = 0
            journalEntries.forEach { entry in
                volumeConsumed = entry.volumeConsumed + volumeConsumed
            }
            let dailyData =  ConsumptionModel(totalConsumed: volumeConsumed, dailyGoal: dailyJournal.dailyGoal)
            presenter?.interactor(
                self,
                didRetrieveHydration: dailyData
            )
    }
}

// MARK: - Private methods
extension MainScreenInteractor {
     private func fetchAllShortcuts() -> [Shortcut] {
        guard let context = context else {
            fatalError("No context")
        }
         let fetchRequest = Shortcut.sortedFetchRequest
        do {
            let items = try context.fetch(fetchRequest)
            return items
        } catch {
            fatalError("\(error)")
        }
    }

    private func updateDailyGoalIfNeeded(for journal: DailyJournal) {
        if journal.dailyGoal == 0 {
            guard let context = context else {
                fatalError("No context")
            }
            context.performChanges {
                journal.dailyGoal = UserData.goal(context: context)
            }
        }
    }
}
