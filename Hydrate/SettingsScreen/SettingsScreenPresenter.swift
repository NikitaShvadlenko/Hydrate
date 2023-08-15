import Foundation

final class SettingsScreenPresenter {
    weak var view: SettingsScreenViewInput?
    weak var moduleOutput: SettingsScreenModuleOutput?
    var interactor: SettingsScreenInteractorInput?
    var router: SettingsScreenRouterInput?
    var collectionViewManager: SettingsCollectionViewManagerProtocol?
}

// MARK: - SettingsScreenViewOutput
extension SettingsScreenPresenter: SettingsScreenViewOutput {
    func viewDidLoad(_ view: SettingsScreenViewInput) {
        view.configureViews()
        let viewModel = generateViewModel()
        collectionViewManager?.setSettingsViewModel(with: viewModel)
    }
}

// MARK: - SettingsScreenInteractorOutput
extension SettingsScreenPresenter: SettingsScreenInteractorOutput {
}

// MARK: - SettingsScreenRouterOutput
extension SettingsScreenPresenter: SettingsScreenRouterOutput {
}

// MARK: - SettingsScreenModuleInput
extension SettingsScreenPresenter: SettingsScreenModuleInput {
    func configureModule(output: SettingsScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension SettingsScreenPresenter {
    // swiftlint:disable function_body_length
    func generateViewModel() -> SettingsViewModel {
        return SettingsViewModel(
            sections: [
                SectionViewModel(
                    sectionType: .yourInfo,
                    sectionTitle: L10n.Settings.Section.yourInfo,
                    cells: [
                        CellViewModel(
                            cellType: .personalInformation,
                            title: L10n.Settings.Cell.personalInformation,
                            action: { print("routing to personal info settings screen") }
                        ),
                        CellViewModel(
                            cellType: .changeGoal,
                            title: L10n.Settings.Cell.changeGoal,
                            action: { print("routing to change goal settings screen") }),
                        CellViewModel(
                            cellType: .theme,
                            title: L10n.Settings.Cell.theme,
                            action: { print("routing to theme settings screen") }
                        ),
                        CellViewModel(
                            cellType: .connections,
                            title: L10n.Settings.Cell.connections,
                            action: { print("routing to connecitons settings screen") }
                        )
                    ]
                ),

                SectionViewModel(
                    sectionType: .drinks,
                    sectionTitle: L10n.Settings.Section.drinks,
                    cells: [
                        CellViewModel(
                            cellType: .yourDrinks,
                            title: L10n.Settings.Cell.yourDrinks,
                            action: { print("routing to your drinks settings screen") }
                            ),
                        CellViewModel(
                            cellType: .customDrinks,
                            title: L10n.Settings.Cell.customDrinks,
                            action: { print("routing to connecitons settings screen") }
                        )
                    ]
                ),

                SectionViewModel(
                    sectionType: .aboutApp,
                    sectionTitle: L10n.Settings.Section.aboutApp,
                    cells: [
                        CellViewModel(
                            cellType: .aboutApp,
                            title: L10n.Settings.Cell.abooutApp,
                            action: { print("routing to about app settings screen") }
                        )
                    ]
                )
            ]
        )
    }
}
