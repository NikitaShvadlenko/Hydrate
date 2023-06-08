import UIKit

enum RegistrationScreenAssembly {
    static func assemble() -> AssembledModule<RegistrationScreenModuleInput> {
        let viewController = RegistrationScreenViewController()
        let presenter = RegistrationScreenPresenter()
        let interactor = RegistrationScreenInteractor()
        let router = RegistrationScreenRouter()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
