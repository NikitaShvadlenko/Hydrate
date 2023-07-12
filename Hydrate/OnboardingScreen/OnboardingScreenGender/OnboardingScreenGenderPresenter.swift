import Foundation

final class OnboardingScreenGenderPresenter {
    weak var view: OnboardingScreenGenderViewInput?
    weak var moduleOutput: OnboardingScreenGenderModuleOutput?
    var interactor: OnboardingScreenGenderInteractorInput?
    var router: OnboardingScreenGenderRouterInput?
}

// MARK: - OnboardingScreenGenderViewOutput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderViewOutput {
    func viewDidLoad(_ view: OnboardingScreenGenderViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingScreenGenderInteractorOutput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderInteractorOutput {
}

// MARK: - OnboardingScreenGenderRouterOutput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderRouterOutput {
}

// MARK: - OnboardingScreenGenderModuleInput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderModuleInput {
    func configureModule(output: OnboardingScreenGenderModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderPresenter {
}
