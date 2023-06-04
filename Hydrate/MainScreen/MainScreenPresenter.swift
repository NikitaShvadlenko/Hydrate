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
        interactor?.retrieveHydrationData()
        interactor?.retriveShortcuts()
    }
}

// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveShortcuts shortcuts: [Shortcut]) {
        shortcutsManager?.shortcuts = shortcuts
        view?.reloadShortcutsCollection()
    }

    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveHydration: HydrationProgressModel) {
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
            print("Asking interactor to record a drink \(shortcuts[indexPath.item].imageName)")
        } else {
            print("Asking vc to pop a screen with addShortcut")
        }
    }
}

// MARK: - Private methods
extension MainScreenPresenter {
}
