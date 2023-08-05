// sourcery: AutoMockable
import Foundation
protocol OnboardingScreenViewInput: AnyObject {
    func configureViews()
}

protocol OnboardingScreenViewOutput {
    func viewDidLoad(_ view: OnboardingScreenViewInput)
    func viewDidChooseActivityLevel(_ view: OnboardingScreenViewInput, activityLevel: ActivityLevel)
    func viewDidChooseGender(_ view: OnboardingScreenViewInput, gender: Gender)
    func viewDidChooseTheme(_ view: OnboardingScreenViewInput, theme: Theme)
    func viewDidChooseGoal(_ view: OnboardingScreenViewInput, goal: Double, preferredUnits: Dimension)
    func viewDidChooseWeight(_ view: OnboardingScreenViewInput, weight: Double, preferredUnits: Dimension)
    func viewDidRequestGoal(_ view: OnboardingScreenViewInput, units: Dimension) -> Double
    func viewDidCompleteOnboarding(_ view: OnboardingScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingScreenRouterInput {
    func routeToMainScreen()
}

protocol OnboardingScreenRouterOutput: AnyObject {
}

protocol OnboardingScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingScreenModuleOutput: AnyObject {
}
