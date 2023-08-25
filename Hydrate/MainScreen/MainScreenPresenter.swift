import Foundation

final class MainScreenPresenter {

    weak var view: MainScreenViewInput?
    weak var moduleOutput: MainScreenModuleOutput?
    var interactor: MainScreenInteractorInput?
    var router: MainScreenRouterInput?
    var mainScreenManager: ManagesMainScreen?
}

// MARK: - MainScreenViewOutput
extension MainScreenPresenter: MainScreenViewOutput {
    func viewDidLoad(_ view: MainScreenViewInput) {
       view.configureViews()
       interactor?.retrieveUserData()
    }
}

// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {
    func interactorFailedToRetrieveUserData(_ interactor: MainScreenInteractorInput) {
        router?.routeToOnboardingScreen()
    }

    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveUserData userData: UserData) {
        print("retrieved the following:")
        print("""
                Gender: \(userData.gender),
                goal: \(userData.dailyGoal),
                activity level: \(userData.activityLevel),
                weightMeasurement: \(userData.weightMeasurementUnit.rawValue),
                weight: \(userData.weight),
                volumeUnit: \(userData.volumeMeasurementUnit)
              """)
        interactor.retrieveHydrationData()
        interactor.retriveShortcuts()
    }

    func interactor(_ interactor: MainScreenInteractorInput, didInsertJournalEntry itemName: String) {
        print("Did Insert", itemName)
        interactor.retrieveHydrationData()
    }

    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveShortcuts shortcuts: [Shortcut]) {
        // TODO: shortcuts
        view?.reloadShortcutsCollection()
    }

    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveHydration: HydrationViewModel) {
        view?.setHydration(model: didRetrieveHydration)
    }
}

// MARK: - MainScreenRouterOutput
extension MainScreenPresenter: MainScreenRouterOutput {
}

// MARK: - MainScreenModuleInput
extension MainScreenPresenter: MainScreenModuleInput {
    func configureModule(output: MainScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - MainScreenManagerDelegate
extension MainScreenPresenter: MainScreenManagerDelegate {

}

// MARK: - Private methods
extension MainScreenPresenter {
}
