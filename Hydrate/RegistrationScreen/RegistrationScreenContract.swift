// sourcery: AutoMockable
protocol RegistrationScreenViewInput: AnyObject {
    func configureViews()
}

protocol RegistrationScreenViewOutput {
    func viewDidLoad(_ view: RegistrationScreenViewInput)
}

// sourcery: AutoMockable
protocol RegistrationScreenInteractorInput {
}

// sourcery: AutoMockable
protocol RegistrationScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol RegistrationScreenRouterInput {
}

protocol RegistrationScreenRouterOutput: AnyObject {
}

protocol RegistrationScreenModuleInput: AnyObject {
	func configureModule(output: RegistrationScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol RegistrationScreenModuleOutput: AnyObject {
}
