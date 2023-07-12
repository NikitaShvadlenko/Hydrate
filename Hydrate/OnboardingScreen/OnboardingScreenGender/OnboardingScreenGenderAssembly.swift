import UIKit

enum OnboardingScreenGenderAssembly {
    static func assemble() -> AssembledModule<OnboardingScreenGenderModuleInput> {
        let viewController = OnboardingScreenGenderViewController()
        let presenter = OnboardingScreenGenderPresenter()
        let interactor = OnboardingScreenGenderInteractor()
        let router = OnboardingScreenGenderRouter()

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
