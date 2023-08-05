import Foundation

final class OnboardingGoalScreenPresenter {
    weak var view: OnboardingGoalScreenViewInput?
    weak var moduleOutput: OnboardingGoalScreenModuleOutput?
    var interactor: OnboardingGoalScreenInteractorInput?
    var router: OnboardingGoalScreenRouterInput?
    var dimension: Dimension?
    var goal: Double?
}

// MARK: - OnboardingGoalScreenViewOutput
extension OnboardingGoalScreenPresenter: OnboardingGoalScreenViewOutput {
    func viewDidPressNextButton(_ view: OnboardingGoalScreenViewInput) {
        guard let goal = goal,
            let dimension = dimension else {
            fatalError("One of the values is nil")
        }
        view.setGoal(goal: goal, dimension: dimension)
    }

    func viewDidSelectGoalDimension(_ view: OnboardingGoalScreenViewInput, _ dimension: Dimension) {
        self.dimension = dimension
    }

    func viewDidInsertVolumeValue(_ view: OnboardingGoalScreenViewInput, value: Double) {
        self.goal = value
    }

    func viewDidLoad(_ view: OnboardingGoalScreenViewInput) {
        view.configureViews()
        guard let dimension = dimension else {
            fatalError()
        }
        self.goal = view.requestGoal(for: dimension)
        guard let goal = goal else {
            fatalError("Goal was not provided")
        }
        view.updateGoal(goal: goal)

    }
}

// MARK: - OnboardingGoalScreenInteractorOutput
extension OnboardingGoalScreenPresenter: OnboardingGoalScreenInteractorOutput {
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
