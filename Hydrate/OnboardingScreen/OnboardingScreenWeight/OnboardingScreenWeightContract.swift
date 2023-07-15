// sourcery: AutoMockable
protocol OnboardingScreenWeightViewInput: AnyObject {
    func configureViews()
}

protocol OnboardingScreenWeightViewOutput {
    func viewDidLoad(_ view: OnboardingScreenWeightViewInput)
}

// sourcery: AutoMockable
protocol OnboardingScreenWeightInteractorInput {
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
