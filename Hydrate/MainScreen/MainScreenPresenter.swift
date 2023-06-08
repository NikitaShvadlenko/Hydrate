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
        view.configureViews()
        interactor?.retrieveUserData()
        interactor?.retrieveHydrationData()
        interactor?.retriveShortcuts()
    }
}

// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveUserData userData: UserData?) {
        if userData == nil {
            router?.routeToRegistrationScreen()
        }
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
                beverageName: shortcutItem.beverageName,
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
