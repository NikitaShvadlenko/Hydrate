import UIKit

enum OnboardingScreenWeightAssembly {
    static func assemble() -> AssembledModule<OnboardingScreenWeightModuleInput> {
        let viewController = OnboardingScreenWeightViewController()
        let presenter = OnboardingScreenWeightPresenter()
        let interactor = OnboardingScreenWeightInteractor()
        let router = OnboardingScreenWeightRouter()

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
