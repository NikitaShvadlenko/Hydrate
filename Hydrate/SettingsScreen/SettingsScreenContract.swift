// sourcery: AutoMockable
protocol SettingsScreenViewInput: AnyObject {
    func configureViews()
    func setTableViewManager(_ manager: SettingsTableViewManagerProtocol)
}

protocol SettingsScreenViewOutput {
    func viewDidLoad(_ view: SettingsScreenViewInput)
}

// sourcery: AutoMockable
protocol SettingsScreenInteractorInput {
}

// sourcery: AutoMockable
protocol SettingsScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol SettingsScreenRouterInput {
}

protocol SettingsScreenRouterOutput: AnyObject {
}

protocol SettingsScreenModuleInput: AnyObject {
	func configureModule(output: SettingsScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol SettingsScreenModuleOutput: AnyObject {
}
