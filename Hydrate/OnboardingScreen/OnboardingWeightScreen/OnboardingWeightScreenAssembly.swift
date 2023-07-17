import UIKit

enum OnboardingWeightScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingWeightScreenModuleInput> {
        let viewController = OnboardingWeightScreenViewController()
        let presenter = OnboardingWeightScreenPresenter()
        let interactor = OnboardingWeightScreenInteractor()
        let router = OnboardingWeightScreenRouter()

        viewController.presenter = presenter
        viewController.setWeightViewDelegate(delegate: viewController)

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
