import Foundation

final class OnboardingWelcomeScreenPresenter {
    weak var view: OnboardingWelcomeScreenViewInput?
    weak var moduleOutput: OnboardingWelcomeScreenModuleOutput?
    var interactor: OnboardingWelcomeScreenInteractorInput?
    var router: OnboardingWelcomeScreenRouterInput?
}

// MARK: - OnboardingWelcomeScreenViewOutput
extension OnboardingWelcomeScreenPresenter: OnboardingWelcomeScreenViewOutput {
    func viewDidLoad(_ view: OnboardingWelcomeScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingWelcomeScreenInteractorOutput
extension OnboardingWelcomeScreenPresenter: OnboardingWelcomeScreenInteractorOutput {
}

// MARK: - OnboardingWelcomeScreenRouterOutput
extension OnboardingWelcomeScreenPresenter: OnboardingWelcomeScreenRouterOutput {
}

// MARK: - OnboardingWelcomeScreenModuleInput
extension OnboardingWelcomeScreenPresenter: OnboardingWelcomeScreenModuleInput {
    func configureModule(output: OnboardingWelcomeScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension OnboardingWelcomeScreenPresenter {
}
