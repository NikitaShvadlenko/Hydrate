import UIKit

enum OnboardingScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingScreenModuleInput> {
        let viewController = OnboardingScreenViewController()
        let presenter = OnboardingScreenPresenter()
        let interactor = OnboardingScreenInteractor()
        let router = OnboardingScreenRouter()

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
