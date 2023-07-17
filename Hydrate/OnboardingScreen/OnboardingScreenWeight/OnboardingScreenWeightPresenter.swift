import Foundation

final class OnboardingScreenWeightPresenter {
    weak var view: OnboardingScreenWeightViewInput?
    weak var moduleOutput: OnboardingScreenWeightModuleOutput?
    var interactor: OnboardingScreenWeightInteractorInput?
    var router: OnboardingScreenWeightRouterInput?
}

// MARK: - OnboardingScreenWeightViewOutput
extension OnboardingScreenWeightPresenter: OnboardingScreenWeightViewOutput {
    func viewDidSelectMassDimension(_ dimension: Dimension) {
        interactor?.saveDimension(dimension)
    }

    func viewDidLoad(_ view: OnboardingScreenWeightViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingScreenWeightInteractorOutput
extension OnboardingScreenWeightPresenter: OnboardingScreenWeightInteractorOutput {
}

// MARK: - OnboardingScreenWeightRouterOutput
extension OnboardingScreenWeightPresenter: OnboardingScreenWeightRouterOutput {
}

// MARK: - OnboardingScreenWeightModuleInput
extension OnboardingScreenWeightPresenter: OnboardingScreenWeightModuleInput {
    func configureModule(output: OnboardingScreenWeightModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension OnboardingScreenWeightPresenter {
}
