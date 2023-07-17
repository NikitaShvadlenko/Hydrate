import UIKit

enum OnboardingGenderScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingGenderScreenModuleInput> {
        let viewController = OnboardingGenderScreenViewController()
        let presenter = OnboardingGenderScreenPresenter()
        let interactor = OnboardingGenderScreenInteractor()
        let router = OnboardingGenderScreenRouter()
        let genderSelectionViewManager = GenderSelectionViewManager()
        genderSelectionViewManager.delegate = presenter

        viewController.presenter = presenter
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
