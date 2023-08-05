import Foundation

final class OnboardingWeightScreenPresenter {
    weak var view: OnboardingWeightScreenViewInput?
    weak var moduleOutput: OnboardingWeightScreenModuleOutput?
    var interactor: OnboardingWeightScreenInteractorInput?
    var router: OnboardingWeightScreenRouterInput?
    var dimension: Dimension?
    var weight: Double?
}

// MARK: - OnboardingWeightScreenViewOutput
extension OnboardingWeightScreenPresenter: OnboardingWeightScreenViewOutput {
    func viewDidPressNextButton(_ view: OnboardingWeightScreenViewInput) {
        guard
            let weight = weight,
            let dimension = dimension else {
            fatalError("Either weight or dimension is nil")
        }
        view.setWeight(weight: weight, dimension: dimension)
    }

    func viewDidSelectMassDimension(_ view: OnboardingWeightScreenViewInput, _ dimension: Dimension) {
        self.dimension = dimension
    }

    func viewDidInsertWeightValue(_ view: OnboardingWeightScreenViewInput, value: Double) {
        self.weight = value
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
