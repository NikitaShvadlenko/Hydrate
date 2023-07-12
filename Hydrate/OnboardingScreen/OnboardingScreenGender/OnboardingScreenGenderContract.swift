// sourcery: AutoMockable
protocol OnboardingScreenGenderViewInput: AnyObject {
    func configureViews()
}

protocol OnboardingScreenGenderViewOutput {
    func viewDidLoad(_ view: OnboardingScreenGenderViewInput)
}

// sourcery: AutoMockable
protocol OnboardingScreenGenderInteractorInput {
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
