import UIKit

final class MainScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: MainScreenRouterOutput?
}

// MARK: - MainScreenRouterInput
extension MainScreenRouter: MainScreenRouterInput {
    func routeToRegistrationScreen() {
        let registrationViewController = RegistrationScreenAssembly.assemble().viewController
        viewController?
            .navigationController?
            .pushViewController(
                registrationViewController,
                animated: true
            )
    }
}

// MARK: - Private methods
extension MainScreenRouter {
}
