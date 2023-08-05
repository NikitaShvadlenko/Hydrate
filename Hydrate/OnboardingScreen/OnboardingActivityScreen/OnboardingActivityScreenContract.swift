import UIKit
// sourcery: AutoMockable
protocol OnboardingActivityScreenViewInput: AnyObject {
    func configureViews()
    func collectionViewDidSelectCell(at indexPath: IndexPath)
    func setActivityLevel(activityLevel: ActivityLevel)
}

protocol OnboardingActivityScreenViewOutput {
    func viewDidLoad(_ view: OnboardingActivityScreenViewInput)
    func viewDidPressNextButton(_ view: OnboardingActivityScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingActivityScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingActivityScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingActivityScreenRouterInput {
}

protocol OnboardingActivityScreenRouterOutput: AnyObject {
}

protocol OnboardingActivityScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingActivityScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingActivityScreenModuleOutput: AnyObject {
}
