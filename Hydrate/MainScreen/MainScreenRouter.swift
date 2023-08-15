import UIKit

final class MainScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: MainScreenRouterOutput?
}

// MARK: - MainScreenRouterInput
extension MainScreenRouter: MainScreenRouterInput {
    func routeToOnboardingScreen() {
        let registrationViewController = OnboardingScreenAssembly.assemble().viewController
        viewController?
            .navigationController?
            .pushViewController(
                registrationViewController,
                animated: true
            )
    }

    func routeToSettingsScreen() {
        let settingsViewController = SettingsScreenAssembly.assemble().viewController
        viewController?
            .navigationController?
            .pushViewController(
                settingsViewController, animated: true
            )
    }
}

// MARK: - Private methods
extension MainScreenRouter {
}
