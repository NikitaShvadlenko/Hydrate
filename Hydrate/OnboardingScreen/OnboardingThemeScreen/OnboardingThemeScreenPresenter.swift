import Foundation

final class OnboardingThemeScreenPresenter {
    weak var view: OnboardingThemeScreenViewInput?
    weak var moduleOutput: OnboardingThemeScreenModuleOutput?
    var interactor: OnboardingThemeScreenInteractorInput?
    var router: OnboardingThemeScreenRouterInput?
    var themeSelectionManager: ThemeSelectionViewManagerProtocol?
    var selectedTheme: Theme?
}

// MARK: - OnboardingThemeScreenViewOutput
extension OnboardingThemeScreenPresenter: OnboardingThemeScreenViewOutput {
    func viewDidPressNextButton(_ view: OnboardingThemeScreenViewInput) {
        guard let theme = selectedTheme else {
            fatalError("Theme was not selected, but the button pressed")
        }
        view.setTheme(theme)
    }

    func viewDidLoad(_ view: OnboardingThemeScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingThemeScreenInteractorOutput
extension OnboardingThemeScreenPresenter: OnboardingThemeScreenInteractorOutput {
    func interactor(_ interactor: OnboardingThemeScreenInteractorInput, didSaveTheme theme: Theme) {
        print("Once next is pressed, need to open next screen")
    }
}

// MARK: - OnboardingThemeScreenRouterOutput
extension OnboardingThemeScreenPresenter: OnboardingThemeScreenRouterOutput {
}

// MARK: - OnboardingThemeScreenModuleInput
extension OnboardingThemeScreenPresenter: OnboardingThemeScreenModuleInput {
    func configureModule(output: OnboardingThemeScreenModuleOutput?) {
        self.moduleOutput = output
    }
}
// MARK: ThemeSelectionViewManagerDelegate
extension OnboardingThemeScreenPresenter: ThemeSelectionViewManagerDelegate {
    func genederSelectionViewManager(
        _ genederSelectionViewManager: ThemeSelectionViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedTheme = genederSelectionViewManager.themes[indexPath.item]
        view?.collectionViewDidSelectCell(at: indexPath)
    }
}

// MARK: - Private methods
extension OnboardingThemeScreenPresenter {
}
