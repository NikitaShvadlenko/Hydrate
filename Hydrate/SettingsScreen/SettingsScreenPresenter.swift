import Foundation

final class SettingsScreenPresenter {
    weak var view: SettingsScreenViewInput?
    weak var moduleOutput: SettingsScreenModuleOutput?
    var interactor: SettingsScreenInteractorInput?
    var router: SettingsScreenRouterInput?
}

// MARK: - SettingsScreenViewOutput
extension SettingsScreenPresenter: SettingsScreenViewOutput {
    func viewDidLoad(_ view: SettingsScreenViewInput) {
        view.configureViews()
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
}
