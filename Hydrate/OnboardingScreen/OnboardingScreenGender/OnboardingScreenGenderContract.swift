import UIKit
// sourcery: AutoMockable
protocol OnboardingScreenGenderViewInput: AnyObject {
    func configureViews()
    func collectionViewDidSelectCell(at indexPath: IndexPath)
}

protocol OnboardingScreenGenderViewOutput {
    func viewDidLoad(_ view: OnboardingScreenGenderViewInput)
    func viewDidPressNextButton(_ view: OnboardingScreenGenderViewInput)
}

// sourcery: AutoMockable
protocol OnboardingScreenGenderInteractorInput {
    func saveGender(_ gender: Gender)
}

// sourcery: AutoMockable
protocol OnboardingScreenGenderInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingScreenGenderRouterInput {
}

protocol OnboardingScreenGenderRouterOutput: AnyObject {
}

protocol OnboardingScreenGenderModuleInput: AnyObject {
	func configureModule(output: OnboardingScreenGenderModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingScreenGenderModuleOutput: AnyObject {
}
