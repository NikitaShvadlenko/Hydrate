import Foundation

final class MainScreenPresenter {

    weak var view: MainScreenViewInput?
    weak var moduleOutput: MainScreenModuleOutput?
    var interactor: MainScreenInteractorInput?
    var router: MainScreenRouterInput?
    var shortcutsManager: ShortcutsViewManagerProtocol?
}

// MARK: - MainScreenViewOutput
extension MainScreenPresenter: MainScreenViewOutput {
    func viewDidLoad(_ view: MainScreenViewInput) {
  //      router?.routeToOnboardingScreen()
//        router?.routeToSettingsScreen()
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
        shortcutsManager?.shortcuts = shortcuts
        view?.reloadShortcutsCollection()
    }

    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveHydration: ConsumptionModel) {
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

// MARK: - ShortcutsViewManagerProtocol
extension MainScreenPresenter: ShortcutsViewManagerDelegate {

    func shortcutsViewManager(
        _ shortcutsViewManager: ShortcutsViewManagerProtocol,
        didCalculateNumberOfPages numberOfPages: Int
    ) {
        view?.setNumberOfShortcutPages(numberOfPages)
    }
    func shortcutsViewManager(_ shortcutsViewManager: ShortcutsViewManagerProtocol, didMoveToPageNumber: Int) {
        view?.selectShortcutPage(didMoveToPageNumber)
    }

    func shortcutsViewManager(
        _ shortcutsViewManager: ShortcutsViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    ) {
        let shortcuts = shortcutsViewManager.shortcuts
        if !shortcuts.isEmpty && indexPath.item != shortcuts.count {
            let shortcutItem = shortcuts[indexPath.item]
            interactor?.insertJournalEntry(
                beverage: shortcutItem.beverage,
                volumeConsumed: shortcutItem.volumeConsumed
            )
        } else {
            print("Asking vc to pop a screen with addShortcut")
        }
    }
}

// MARK: - Private methods
extension MainScreenPresenter {
}
