import Foundation

final class OnboardingScreenPresenter {
    weak var view: OnboardingScreenViewInput?
    weak var moduleOutput: OnboardingScreenModuleOutput?
    var interactor: OnboardingScreenInteractorInput?
    var router: OnboardingScreenRouterInput?
}

// MARK: - RegistrationScreenViewOutput
extension OnboardingScreenPresenter: OnboardingScreenViewOutput {
    func viewDidCompleteOnboarding(_ view: OnboardingScreenViewInput) {
        router?.routeToMainScreen()
    }

    func viewDidLoad(_ view: OnboardingScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - RegistrationScreenInteractorOutput
extension OnboardingScreenPresenter: OnboardingScreenInteractorOutput {
}

// MARK: - RegistrationScreenRouterOutput
extension OnboardingScreenPresenter: OnboardingScreenRouterOutput {
}

// MARK: - RegistrationScreenModuleInput
extension OnboardingScreenPresenter: OnboardingScreenModuleInput {
    func configureModule(output: OnboardingScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension OnboardingScreenPresenter {
}
