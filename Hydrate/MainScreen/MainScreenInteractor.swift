import Foundation
import CoreData

final class MainScreenInteractor {
    weak var presenter: MainScreenInteractorOutput?
    var dataService: (any DataStorage)?
}

// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
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
    private func fetchAllEntries() -> [JournalEntry] {
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
}
