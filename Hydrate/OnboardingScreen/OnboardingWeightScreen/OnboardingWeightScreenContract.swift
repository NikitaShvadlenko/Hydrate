import Foundation
// sourcery: AutoMockable
protocol OnboardingWeightScreenViewInput: AnyObject {
    func configureViews()
    func setWeight(weight: Double, dimension: Dimension)
}

protocol OnboardingWeightScreenViewOutput {
    func viewDidLoad(_ view: OnboardingWeightScreenViewInput)
    func viewDidSelectMassDimension(_ view: OnboardingWeightScreenViewInput, _ dimension: Dimension)
    func viewDidInsertWeightValue(_ view: OnboardingWeightScreenViewInput, value: Double)
    func viewDidPressNextButton(_ view: OnboardingWeightScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingWeightScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingWeightScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingWeightScreenRouterInput {
}

protocol OnboardingWeightScreenRouterOutput: AnyObject {
}

protocol OnboardingWeightScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingWeightScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingWeightScreenModuleOutput: AnyObject {
}
