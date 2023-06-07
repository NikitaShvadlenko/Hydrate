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
        DispatchQueue.main.async {
            self.presenter?.interactor(self, didInsertJournalEntry: beverageName)
        }
    }

    func retriveShortcuts() {
        let shortcuts = fetchAllShortcuts()
        presenter?.interactor(self, didRetrieveShortcuts: shortcuts)
    }

    func retrieveHydrationData() {
        dataService?.insertShortcut(colorName: Asset.progressViewBaseColor.name, imageName: Asset.waterDrop.name, beverageName: "Water", volumeConsumed: 250)
        // TODO: fetch information for a certain day, not total.
        let journalEntries = fetchAllEntries()
        var volumeConsumed = 0.0
        journalEntries.forEach { entry in
            volumeConsumed = entry.volumeConsumed + volumeConsumed
        }

        presenter?.interactor(self, didRetrieveHydration: ConsumptionModel(totalConsumed: volumeConsumed))
    }
}

// MARK: - Private methods
extension MainScreenInteractor {
     func fetchAllEntries() -> [JournalEntry] {
        guard let dataStorage = dataService else {
            fatalError("No data storage is set")
        }
        do {
            let items = try dataStorage.retrieveAllJournalEntries()
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
           let items = try shortcutService.retrieveAllShortcuts()
            return items
        } catch {
            fatalError("\(error)")
        }
    }

    private func retrieveTodaysHydration() {

    }
}
