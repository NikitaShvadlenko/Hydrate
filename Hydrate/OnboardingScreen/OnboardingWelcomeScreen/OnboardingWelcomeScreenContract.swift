// sourcery: AutoMockable
protocol OnboardingWelcomeScreenViewInput: AnyObject {
    func configureViews()
}

protocol OnboardingWelcomeScreenViewOutput {
    func viewDidLoad(_ view: OnboardingWelcomeScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingWelcomeScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingWelcomeScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingWelcomeScreenRouterInput {
}

protocol OnboardingWelcomeScreenRouterOutput: AnyObject {
}

protocol OnboardingWelcomeScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingWelcomeScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingWelcomeScreenModuleOutput: AnyObject {
}
