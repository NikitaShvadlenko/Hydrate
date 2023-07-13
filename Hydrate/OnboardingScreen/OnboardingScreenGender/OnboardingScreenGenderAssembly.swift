import UIKit

enum OnboardingScreenGenderAssembly {
    static func assemble() -> AssembledModule<OnboardingScreenGenderModuleInput> {
        let viewController = OnboardingScreenGenderViewController()
        let presenter = OnboardingScreenGenderPresenter()
        let interactor = OnboardingScreenGenderInteractor()
        let router = OnboardingScreenGenderRouter()
        let genderSelectionViewManager = GenderSelectionViewManager()
        genderSelectionViewManager.delegate = presenter

        viewController.presenter = presenter
        viewController.setNavigationButtonDelegate(delegate: viewController)
        viewController.setCollectionViewDataSource(dataSource: genderSelectionViewManager)
        viewController.setCollectionViewDelegate(delegate: genderSelectionViewManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.genderSelectionManager = genderSelectionViewManager

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
