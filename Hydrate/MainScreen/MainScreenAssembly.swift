import UIKit
import CoreData

enum MainScreenAssembly {
    static func assemble(managedObjectContext: NSManagedObjectContext) -> AssembledModule<MainScreenModuleInput> {
        let viewController = MainScreenViewController()
        let presenter = MainScreenPresenter()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()
        let coreDataService = CoreDataService.shared

        let mainScreenManager = MainScreenManager()

        presenter.mainScreenManager = mainScreenManager

        viewController.presenter = presenter
        viewController.setMainScreenManager(mainScreenManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        interactor.context = coreDataService.context

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
