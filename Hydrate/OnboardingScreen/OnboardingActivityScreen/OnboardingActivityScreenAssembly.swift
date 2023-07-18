import UIKit

enum OnboardingActivityScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingActivityScreenModuleInput> {
        let viewController = OnboardingActivityScreenViewController()
        let presenter = OnboardingActivityScreenPresenter()
        let interactor = OnboardingActivityScreenInteractor()
        let router = OnboardingActivityScreenRouter()
        let activitySelectionViewManager = ActivitySelectionViewManager()
        activitySelectionViewManager.delegate = presenter

        viewController.presenter = presenter
        viewController.setCollectionViewDataSource(dataSource: activitySelectionViewManager)
        viewController.setCollectionViewDelegate(delegate: activitySelectionViewManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.activitySelectionManager = activitySelectionViewManager

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
