import Foundation

final class MainScreenInteractor {
    weak var presenter: MainScreenInteractorOutput?
}

// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
    func retrieveHydrationData() {
        let hydration = HydrationProgressModel(percentage: 30,
         amount: Measurement(value: 3, unit: .cups),
         variance: Measurement(value: 1, unit: .cups)
        )
        presenter?.interactor(self, didRetrieveHydration: hydration)
    }
}

// MARK: - Private methods
extension MainScreenInteractor {
}
