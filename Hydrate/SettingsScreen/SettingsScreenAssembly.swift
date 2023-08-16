import UIKit

enum SettingsScreenAssembly {
    static func assemble() -> AssembledModule<SettingsScreenModuleInput> {
        let viewController = SettingsScreenViewController()
        let presenter = SettingsScreenPresenter()
        let interactor = SettingsScreenInteractor()
        let router = SettingsScreenRouter()
        let tableViewManager = SettingsTableViewViewManager()

        viewController.presenter = presenter
        viewController.setTableViewManager(tableViewManager)
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.collectionViewManager = tableViewManager

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
