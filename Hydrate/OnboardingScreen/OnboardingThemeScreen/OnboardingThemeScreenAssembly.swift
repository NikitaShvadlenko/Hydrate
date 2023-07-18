import UIKit

enum OnboardingThemeScreenAssembly {
    static func assemble() -> AssembledModule<OnboardingThemeScreenModuleInput> {
        let viewController = OnboardingThemeScreenViewController()
        let presenter = OnboardingThemeScreenPresenter()
        let interactor = OnboardingThemeScreenInteractor()
        let router = OnboardingThemeScreenRouter()
        let themeSelectionViewManager = ThemeSelectionViewManager()
        themeSelectionViewManager.delegate = presenter

        viewController.presenter = presenter
        viewController.setCollectionViewDataSource(dataSource: themeSelectionViewManager)
        viewController.setCollectionViewDelegate(delegate: themeSelectionViewManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.themeSelectionManager = themeSelectionViewManager

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
