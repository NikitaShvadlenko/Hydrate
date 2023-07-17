import Foundation
// sourcery: AutoMockable
protocol OnboardingWeightScreenViewInput: AnyObject {
    func configureViews()
}

protocol OnboardingWeightScreenViewOutput {
    func viewDidLoad(_ view: OnboardingWeightScreenViewInput)
    func viewDidSelectMassDimension(_ view: OnboardingWeightScreenViewInput, _ dimension: Dimension)
    func viewDidInsertWeightValue(_ view: OnboardingWeightScreenViewInput, value: Double)
}

// sourcery: AutoMockable
protocol OnboardingWeightScreenInteractorInput {
    func saveDimension(_ dimension: Dimension)
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
