import Foundation

final class RegistrationScreenPresenter {
    weak var view: RegistrationScreenViewInput?
    weak var moduleOutput: RegistrationScreenModuleOutput?
    var interactor: RegistrationScreenInteractorInput?
    var router: RegistrationScreenRouterInput?
}

// MARK: - RegistrationScreenViewOutput
extension RegistrationScreenPresenter: RegistrationScreenViewOutput {
    func viewDidLoad(_ view: RegistrationScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - RegistrationScreenInteractorOutput
extension RegistrationScreenPresenter: RegistrationScreenInteractorOutput {
}

// MARK: - RegistrationScreenRouterOutput
extension RegistrationScreenPresenter: RegistrationScreenRouterOutput {
}

// MARK: - RegistrationScreenModuleInput
extension RegistrationScreenPresenter: RegistrationScreenModuleInput {
    func configureModule(output: RegistrationScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension RegistrationScreenPresenter {
}
