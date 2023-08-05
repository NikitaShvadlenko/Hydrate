import Foundation
// sourcery: AutoMockable
protocol OnboardingGoalScreenViewInput: AnyObject {
    func configureViews()
    func requestGoal(for dimension: Dimension) -> Double
    func updateGoal(goal: Double)
    func setGoal(goal: Double, dimension: Dimension)
}

protocol OnboardingGoalScreenViewOutput {
    func viewDidLoad(_ view: OnboardingGoalScreenViewInput)
    func viewDidSelectGoalDimension(_ view: OnboardingGoalScreenViewInput, _ dimension: Dimension)
    func viewDidInsertVolumeValue(_ view: OnboardingGoalScreenViewInput, value: Double)
    func viewDidPressNextButton(_ view: OnboardingGoalScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingGoalScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingGoalScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingGoalScreenRouterInput {
}

protocol OnboardingGoalScreenRouterOutput: AnyObject {
}

protocol OnboardingGoalScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingGoalScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingGoalScreenModuleOutput: AnyObject {
}
