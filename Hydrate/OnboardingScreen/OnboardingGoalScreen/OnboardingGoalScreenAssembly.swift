import UIKit

enum OnboardingGoalScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingGoalScreenModuleInput> {
        let viewController = OnboardingGoalScreenViewController()
        let presenter = OnboardingGoalScreenPresenter()
        let interactor = OnboardingGoalScreenInteractor()
        let router = OnboardingGoalScreenRouter()

        viewController.presenter = presenter
        viewController.setGoalViewDelegate(delegate: viewController)

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
