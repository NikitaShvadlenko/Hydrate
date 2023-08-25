// sourcery: AutoMockable
protocol MainScreenViewInput: AnyObject {
    func configureViews()
    func setHydration(model: HydrationViewModel)
    func reloadShortcutsCollection()
}

protocol MainScreenViewOutput {
    func viewDidLoad(_ view: MainScreenViewInput)
}

// sourcery: AutoMockable
protocol MainScreenInteractorInput {
    func retrieveHydrationData()
    func retriveShortcuts()
    func insertJournalEntry(
        beverage: Beverage,
        volumeConsumed: Int
    )
    func retrieveUserData()
}

// sourcery: AutoMockable
protocol MainScreenInteractorOutput: AnyObject {
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveHydration hydration: HydrationViewModel)
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveShortcuts shortcuts: [Shortcut])
    func interactor(_ interactor: MainScreenInteractorInput, didInsertJournalEntry itemName: String)
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveUserData userData: UserData)
    func interactorFailedToRetrieveUserData(_ interactor: MainScreenInteractorInput)
}

// sourcery: AutoMockable
protocol MainScreenRouterInput {
    func routeToOnboardingScreen()
}

protocol MainScreenRouterOutput: AnyObject {
}

protocol MainScreenModuleInput: AnyObject {
    func configureModule(output: MainScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol MainScreenModuleOutput: AnyObject {
}
