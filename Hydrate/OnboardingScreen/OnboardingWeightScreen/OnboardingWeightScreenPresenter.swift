import Foundation

final class OnboardingWeightScreenPresenter {
    weak var view: OnboardingWeightScreenViewInput?
    weak var moduleOutput: OnboardingWeightScreenModuleOutput?
    var interactor: OnboardingWeightScreenInteractorInput?
    var router: OnboardingWeightScreenRouterInput?
}

// MARK: - OnboardingWeightScreenViewOutput
extension OnboardingWeightScreenPresenter: OnboardingWeightScreenViewOutput {
    func viewDidSelectMassDimension(_ view: OnboardingWeightScreenViewInput, _ dimension: Dimension) {
        interactor?.saveDimension(dimension)
    }

    func viewDidInsertWeightValue(_ view: OnboardingWeightScreenViewInput, value: Double) {
        print("Saved \(value)")
    }

    func viewDidLoad(_ view: OnboardingWeightScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingWeightScreenInteractorOutput
extension OnboardingWeightScreenPresenter: OnboardingWeightScreenInteractorOutput {
}

// MARK: - OnboardingWeightScreenRouterOutput
extension OnboardingWeightScreenPresenter: OnboardingWeightScreenRouterOutput {
}

// MARK: - OnboardingWeightScreenModuleInput
extension OnboardingWeightScreenPresenter: OnboardingWeightScreenModuleInput {
    func configureModule(output: OnboardingWeightScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension OnboardingWeightScreenPresenter {
}
