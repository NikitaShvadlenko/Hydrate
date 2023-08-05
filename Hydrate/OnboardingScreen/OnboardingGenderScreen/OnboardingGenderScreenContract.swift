import UIKit
// sourcery: AutoMockable
protocol OnboardingGenderScreenViewInput: UIViewController {
    func configureViews()
    func collectionViewDidSelectCell(at indexPath: IndexPath)
    func setGender(_ gender: Gender)
}

protocol OnboardingGenderScreenViewOutput {
    func viewDidLoad(_ view: OnboardingGenderScreenViewInput)
    func viewDidPressNextButton(_ view: OnboardingGenderScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingGenderScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingGenderScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingGenderScreenRouterInput {
}

protocol OnboardingGenderScreenRouterOutput: AnyObject {
}

protocol OnboardingGenderScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingGenderScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingGenderScreenModuleOutput: AnyObject {
}
