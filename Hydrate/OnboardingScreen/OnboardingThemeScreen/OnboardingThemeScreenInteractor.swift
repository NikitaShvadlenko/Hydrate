import Foundation

final class OnboardingThemeScreenInteractor {
    weak var presenter: OnboardingThemeScreenInteractorOutput?
}

// MARK: - OnboardingThemeScreenInteractorInput
extension OnboardingThemeScreenInteractor: OnboardingThemeScreenInteractorInput {
    func saveTheme(_ theme: Theme) {
        print("saving", theme.rawValue)
        presenter?.interactor(self, didSaveTheme: theme)
    }
}

// MARK: - Private methods
extension OnboardingThemeScreenInteractor {
}
