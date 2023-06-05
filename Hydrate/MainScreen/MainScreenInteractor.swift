import Foundation
import CoreData

final class MainScreenInteractor {
    weak var presenter: MainScreenInteractorOutput?
    var dataService: (any DataServiceProtocol)?
    var shortcutService: (any DataServiceProtocol)?
}

// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
    func insertJournalEntry(beverageName: String, volumeConsumed: Double) {
        dataService?.insertJournalEntry(beverageName: beverageName, volumeConsumed: volumeConsumed)
        presenter?.interactor(self, didInsertJournalEntry: beverageName)
    }

    func retriveShortcuts() {
        let shortcuts = fetchAllShortcuts()
        presenter?.interactor(self, didRetrieveShortcuts: shortcuts)
    }

    func retrieveHydrationData() {
        // TODO: remove placeholder
        let hydration = HydrationProgressModel(
            goal: Measurement(
                value: 50, unit: .cups),
            amount: Measurement(value: 3, unit: .cups)
        )

        presenter?.interactor(self, didRetrieveHydration: hydration)
    }
}

// MARK: - Private methods
extension MainScreenInteractor {
     func fetchAllEntries() -> [JournalEntry] {
        guard let dataStorage = dataService else {
            fatalError("No data storage is set")
        }
        do {
            let items = try dataStorage.retrieveJournalEntries()
            return items
        } catch {
            fatalError("\(error)")
        }
    }

     private func fetchAllShortcuts() -> [Shortcut] {
        guard let shortcutService = shortcutService else {
            fatalError("No data storage is set")
        }
        do {
           let items = try shortcutService.retrieveShortcuts()
            return items
        } catch {
            fatalError("\(error)")
        }
    }
}
