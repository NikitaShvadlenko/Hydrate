import UIKit

enum OnboardingWelcomeScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingWelcomeScreenModuleInput> {
        let viewController = OnboardingWelcomeScreenViewController()
        let presenter = OnboardingWelcomeScreenPresenter()
        let interactor = OnboardingWelcomeScreenInteractor()
        let router = OnboardingWelcomeScreenRouter()

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
