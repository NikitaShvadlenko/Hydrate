import Foundation

final class OnboardingGoalScreenPresenter {
    weak var view: OnboardingGoalScreenViewInput?
    weak var moduleOutput: OnboardingGoalScreenModuleOutput?
    var interactor: OnboardingGoalScreenInteractorInput?
    var router: OnboardingGoalScreenRouterInput?
}

// MARK: - OnboardingGoalScreenViewOutput
extension OnboardingGoalScreenPresenter: OnboardingGoalScreenViewOutput {
    func viewDidSelectGoalDimension(_ view: OnboardingGoalScreenViewInput, _ dimension: Dimension) {
        interactor?.saveDimension(dimension)
    }

    func viewDidInsertVolumeValue(_ view: OnboardingGoalScreenViewInput, value: Double) {
        print("Saved \(value)")
    }

    func viewDidLoad(_ view: OnboardingGoalScreenViewInput) {
        interactor?.calculateGoal()
        view.configureViews()
    }
}

// MARK: - OnboardingGoalScreenInteractorOutput
extension OnboardingGoalScreenPresenter: OnboardingGoalScreenInteractorOutput {
    func intercactorDidCalculateGoal(_ interactor: OnboardingGoalScreenInteractorInput, goal: Double) {
        view?.updateGoal(goal: goal)
    }

}

// MARK: - OnboardingGoalScreenRouterOutput
extension OnboardingGoalScreenPresenter: OnboardingGoalScreenRouterOutput {
}

// MARK: - OnboardingGoalScreenModuleInput
extension OnboardingGoalScreenPresenter: OnboardingGoalScreenModuleInput {
    func configureModule(output: OnboardingGoalScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension OnboardingGoalScreenPresenter {
}
