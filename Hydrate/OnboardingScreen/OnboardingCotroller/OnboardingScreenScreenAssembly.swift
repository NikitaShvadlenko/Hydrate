import UIKit

enum OnboardingScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingScreenModuleInput> {
        let viewController = OnboardingScreenViewController()
        let presenter = OnboardingScreenPresenter()
        let interactor = OnboardingScreenInteractor()
        let router = OnboardingScreenRouter()
        let builder = UserDataBuilder()
        let context = CoreDataService.shared.context
        let healthKitManager = HealthKitManager()

        viewController.presenter = presenter
        viewController.setBackButtonDelegate(viewController)
        viewController.setNextButtonDelegate(delegate: viewController)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.builder = builder

        interactor.context = context
        interactor.presenter = presenter
        interactor.healthKitManager = healthKitManager

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
