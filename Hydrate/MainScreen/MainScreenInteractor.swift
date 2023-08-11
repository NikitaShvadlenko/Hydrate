import Foundation
import CoreData

final class MainScreenInteractor {
    weak var presenter: MainScreenInteractorOutput?
    var context: NSManagedObjectContext?
}

// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
    func retrieveUserData() {
        let userData = fetchUserData()
        presenter?.interactor(self, didRetrieveUserData: userData)
    }

    func insertJournalEntry(beverageName: String, volumeConsumed: Double) {
        guard let dailyJournal = fetchDailyJournal(for: Date()) else {
            fatalError("Failed to find daily journal ")
        }

        guard let journalEntry = dataService?.insertJournalEntry(
            beverageName: beverageName,
            volumeConsumed: volumeConsumed
        ) else {
            fatalError("Failed to create journal entry")
        }

        dataService?.addJournalEntry(to: dailyJournal, journalEntry: journalEntry)
        DispatchQueue.main.async {
            self.presenter?.interactor(self, didInsertJournalEntry: beverageName)
        }
    }

    func retriveShortcuts() {
        let shortcuts = fetchAllShortcuts()
        presenter?.interactor(self, didRetrieveShortcuts: shortcuts)
    }

    func retrieveHydrationData() {
        if let dailyJournal = fetchDailyJournal(for: Date()) {
            let journalEntries = dailyJournal.journalEntries
            var volumeConsumed = 0.0
            journalEntries.forEach { entry in
                volumeConsumed = entry.volumeConsumed + volumeConsumed
            }
            let dailyData =  ConsumptionModel(totalConsumed: volumeConsumed, dailyGoal: dailyJournal.dailyGoal)
            presenter?.interactor(
                self,
                didRetrieveHydration: dailyData
            )
        } else {
            createDailyJournal(goal: 2500)
            let dailyData =  ConsumptionModel(totalConsumed: 0, dailyGoal: 2500)
            presenter?.interactor(self, didRetrieveHydration: dailyData)
        }
    }
}

// MARK: - Private methods
extension MainScreenInteractor {
     private func fetchAllShortcuts() -> [Shortcut] {
        guard let shortcutService = shortcutService else {
            fatalError("No data storage is set")
        }
        do {
           let items = try shortcutService.retrieveAllShortcuts()
            return items
        } catch {
            fatalError("\(error)")
        }
    }

    func fetchDailyJournal(for date: Date) -> DailyJournal? {
        guard let dataService = dataService else {
            fatalError("No data serice")
        }

        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        guard
            let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay) else {
            fatalError("Failed to add a day to startOfDay")
        }
        let predicate = NSPredicate(format: "date >= %@ && date < %@", startOfDay as NSDate, endOfDay as NSDate)

        do {
            let dailyJournal = try dataService.fetchAllDailyJournals(datePredicate: predicate)
            return dailyJournal.first
        } catch {
            return nil
        }
    }

    func createDailyJournal(goal: Double) {
        dataService?.createDailyJournalEntry(with: goal)
    }

    func fetchUserData() -> UserData? {
        guard let dataService = dataService else {
            fatalError("No data service is set")
        }
        do {
            let userData = try dataService.retrieveUserData()
            return userData
        } catch {
            print(error)
            return nil
        }
    }
}
