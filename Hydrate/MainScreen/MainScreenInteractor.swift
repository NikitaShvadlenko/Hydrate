import Foundation
import CoreData

final class MainScreenInteractor {
    weak var presenter: MainScreenInteractorOutput?
    var context: NSManagedObjectContext?
}

// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
    func retrieveHydrationData() {
        let hydration = HydrationProgressModel(
            goal: Measurement(
                value: 6, unit: .cups),
            amount: Measurement(value: 3, unit: .cups)
        )

        presenter?.interactor(self, didRetrieveHydration: hydration)
    }
}

// MARK: - Private methods
extension MainScreenInteractor {
}
