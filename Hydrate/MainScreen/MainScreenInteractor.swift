import Foundation
import CoreData

final class MainScreenInteractor {
    weak var presenter: MainScreenInteractorOutput?
    var dataService: (any DataStorage)?
    var shortcutService: (any DataStorage)?
}

// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
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
            guard let items = try dataStorage.fetchItems() as? [JournalEntry] else {
                fatalError("Failed to cast items from storage as [JournalEntry]")
            }
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
            guard let items = try shortcutService.fetchItems() as? [Shortcut] else {
                fatalError("Failed to cast items from storage as [JournalEntry]")
            }
            return items
        } catch {
            fatalError("\(error)")
        }
    }
}
