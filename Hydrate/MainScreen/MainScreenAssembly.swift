import UIKit
import CoreData

enum MainScreenAssembly {
    static func assemble(managedObjectContext: NSManagedObjectContext) -> AssembledModule<MainScreenModuleInput> {
        let viewController = MainScreenViewController()
        let presenter = MainScreenPresenter()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()
        let dataService = HydrationDataService(context: managedObjectContext)
        let shortcutsViewManager = ShortcutsViewManager()
        shortcutsViewManager.delegate = presenter

        viewController.presenter = presenter
        viewController.setShortcutsDataSource(shortcutsViewManager)
        viewController.setShortcutsDelegate(shortcutsViewManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.shortcutsManager = shortcutsViewManager

        interactor.presenter = presenter
        interactor.dataService = dataService

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
