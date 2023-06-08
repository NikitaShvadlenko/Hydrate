// sourcery: AutoMockable
protocol MainScreenViewInput: AnyObject {
    func configureViews()
    func setHydration(model: ConsumptionModel)
    func reloadShortcutsCollection()
    func setNumberOfShortcutPages(_ numberOfPages: Int)
    func selectShortcutPage(_ page: Int)
}

protocol MainScreenViewOutput {
    func viewDidLoad(_ view: MainScreenViewInput)
}

// sourcery: AutoMockable
protocol MainScreenInteractorInput {
    func retrieveHydrationData()
    func retriveShortcuts()
    func insertJournalEntry(
        beverageName: String,
        volumeConsumed: Double
    )
    func retrieveUserData()
}

// sourcery: AutoMockable
protocol MainScreenInteractorOutput: AnyObject {
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveHydration hydration: ConsumptionModel)
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveShortcuts shortcuts: [Shortcut])
    func interactor(_ interactor: MainScreenInteractorInput, didInsertJournalEntry itemName: String)
    func interactor(_ interactor: MainScreenInteractorInput, didRetrieveUserData userData: UserData?)
}

// sourcery: AutoMockable
protocol MainScreenRouterInput {
    func routeToRegistrationScreen()
}

protocol MainScreenRouterOutput: AnyObject {
}

protocol MainScreenModuleInput: AnyObject {
    func configureModule(output: MainScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol MainScreenModuleOutput: AnyObject {
}
