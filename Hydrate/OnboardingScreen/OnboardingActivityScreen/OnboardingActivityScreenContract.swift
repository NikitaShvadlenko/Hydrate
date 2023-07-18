import UIKit
// sourcery: AutoMockable
protocol OnboardingActivityScreenViewInput: AnyObject {
    func configureViews()
    func collectionViewDidSelectCell(at indexPath: IndexPath)
}

protocol OnboardingActivityScreenViewOutput {
    func viewDidLoad(_ view: OnboardingActivityScreenViewInput)
    func viewDidPressNextButton(_ view: OnboardingActivityScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingActivityScreenInteractorInput {
    func saveActivity(_ activity: ActivityLevel)
}

// sourcery: AutoMockable
protocol OnboardingActivityScreenInteractorOutput: AnyObject {
    func interactor(_ interactor: OnboardingActivityScreenInteractorInput, didSaveActivity activity: ActivityLevel)
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
