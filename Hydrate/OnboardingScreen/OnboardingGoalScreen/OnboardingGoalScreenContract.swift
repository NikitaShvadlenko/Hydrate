import Foundation
// sourcery: AutoMockable
protocol OnboardingGoalScreenViewInput: AnyObject {
    func configureViews()
    func updateGoal(goal: Double)
}

protocol OnboardingGoalScreenViewOutput {
    func viewDidLoad(_ view: OnboardingGoalScreenViewInput)
    func viewDidSelectGoalDimension(_ view: OnboardingGoalScreenViewInput, _ dimension: Dimension)
    func viewDidInsertVolumeValue(_ view: OnboardingGoalScreenViewInput, value: Double)
}

// sourcery: AutoMockable
protocol OnboardingGoalScreenInteractorInput {
    func saveDimension(_ dimension: Dimension)
    func calculateGoal()
}

// sourcery: AutoMockable
protocol OnboardingGoalScreenInteractorOutput: AnyObject {
    func intercactorDidCalculateGoal(_ interactor: OnboardingGoalScreenInteractorInput, goal: Double)
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
