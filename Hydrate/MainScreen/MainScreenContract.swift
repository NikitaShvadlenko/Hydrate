// sourcery: AutoMockable
protocol MainScreenViewInput: AnyObject {
    func configureViews()
    func setHydration(model: HydrationProgressModel)
    func reloadShortcutsCollection()
}

protocol MainScreenViewOutput {
    func viewDidLoad(_ view: MainScreenViewInput)
}

// sourcery: AutoMockable
protocol MainScreenInteractorInput {
    func retrieveHydrationData()
    func retriveShortcuts()
}

// sourcery: AutoMockable
protocol MainScreenInteractorOutput: AnyObject {
   func interactor(_ interactor: MainScreenInteractorInput, didRetrieveHydration hydration: HydrationProgressModel)
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveShortcuts shortcuts: [Shortcut])
}

// sourcery: AutoMockable
protocol MainScreenRouterInput {
}

protocol MainScreenRouterOutput: AnyObject {
}

protocol MainScreenModuleInput: AnyObject {
	func configureModule(output: MainScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol MainScreenModuleOutput: AnyObject {
}
