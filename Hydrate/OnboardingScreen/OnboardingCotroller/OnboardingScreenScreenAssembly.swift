import UIKit

enum OnboardingScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingScreenModuleInput> {
        let viewController = OnboardingScreenViewController()
        let presenter = OnboardingScreenPresenter()
        let interactor = OnboardingScreenInteractor()
        let router = OnboardingScreenRouter()
        let builder = UserDataBuilder()

        viewController.presenter = presenter
        viewController.setBackButtonDelegate(viewController)
        viewController.setNextButtonDelegate(delegate: viewController)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.builder = builder

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
