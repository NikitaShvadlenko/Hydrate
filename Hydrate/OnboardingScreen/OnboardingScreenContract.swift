// sourcery: AutoMockable
protocol OnboardingScreenViewInput: AnyObject {
    func configureViews()
}

protocol OnboardingScreenViewOutput {
    func viewDidLoad(_ view: OnboardingScreenViewInput)
    func viewDidCompleteOnboarding(_ view: OnboardingScreenViewInput)
}

// sourcery: AutoMockable
protocol OnboardingScreenInteractorInput {
}

// sourcery: AutoMockable
protocol OnboardingScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol OnboardingScreenRouterInput {
    func routeToMainScreen()
}

protocol OnboardingScreenRouterOutput: AnyObject {
}

protocol OnboardingScreenModuleInput: AnyObject {
	func configureModule(output: OnboardingScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol OnboardingScreenModuleOutput: AnyObject {
}
