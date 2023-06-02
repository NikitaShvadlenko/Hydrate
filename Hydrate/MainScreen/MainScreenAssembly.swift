import UIKit
import CoreData

enum MainScreenAssembly {
    static func assemble(managedObjectContext: NSManagedObjectContext) -> AssembledModule<MainScreenModuleInput> {
        let viewController = MainScreenViewController()
        let presenter = MainScreenPresenter()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()
        let dataService = HydrationDataService(context: managedObjectContext)

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

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
