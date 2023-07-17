import UIKit
// sourcery: AutoMockable
protocol OnboardingGenderScreenViewInput: AnyObject {
    func configureViews()
    func collectionViewDidSelectCell(at indexPath: IndexPath)
}

protocol OnboardingGenderScreenViewOutput {
    func viewDidLoad(_ view: OnboardingGenderScreenViewInput)
    func viewDidPressNextButton(_ view: OnboardingGenderScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingGenderScreenInteractorInput {
    func saveGender(_ gender: Gender)
}

// sourcery: AutoMockable
protocol OnboardingGenderScreenInteractorOutput: AnyObject {
    func interactor(_ interactor: OnboardingGenderScreenInteractorInput, didSaveGender gender: Gender)
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
