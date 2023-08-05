import UIKit
// sourcery: AutoMockable
protocol OnboardingThemeScreenViewInput: AnyObject {
    func configureViews()
    func collectionViewDidSelectCell(at indexPath: IndexPath)
    func setTheme(_ theme: Theme)
}

protocol OnboardingThemeScreenViewOutput {
    func viewDidLoad(_ view: OnboardingThemeScreenViewInput)
    func viewDidPressNextButton(_ view: OnboardingThemeScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingThemeScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingThemeScreenInteractorOutput: AnyObject {
    func interactor(_ interactor: OnboardingThemeScreenInteractorInput, didSaveTheme theme: Theme)
}

// sourcery: AutoMockable
protocol OnboardingThemeScreenRouterInput {
}

protocol OnboardingThemeScreenRouterOutput: AnyObject {
}

protocol OnboardingThemeScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingThemeScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingThemeScreenModuleOutput: AnyObject {
}
