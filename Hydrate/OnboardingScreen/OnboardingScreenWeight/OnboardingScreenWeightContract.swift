import Foundation
// sourcery: AutoMockable
protocol OnboardingScreenWeightViewInput: AnyObject {
    func configureViews()
}

protocol OnboardingScreenWeightViewOutput {
    func viewDidLoad(_ view: OnboardingScreenWeightViewInput)
    func viewDidSelectMassDimension(_ view: OnboardingScreenWeightViewInput, _ dimension: Dimension)
    func viewDidInsertWeightValue(_ view: OnboardingScreenWeightViewInput, value: Double)
}

// sourcery: AutoMockable
protocol OnboardingScreenWeightInteractorInput {
    func saveDimension(_ dimension: Dimension)
}

// sourcery: AutoMockable
protocol OnboardingScreenWeightInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingScreenWeightRouterInput {
}

protocol OnboardingScreenWeightRouterOutput: AnyObject {
}

protocol OnboardingScreenWeightModuleInput: AnyObject {
	func configureModule(output: OnboardingScreenWeightModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingScreenWeightModuleOutput: AnyObject {
}
