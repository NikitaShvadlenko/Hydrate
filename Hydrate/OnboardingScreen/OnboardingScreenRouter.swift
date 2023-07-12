import UIKit

final class OnboardingScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: OnboardingScreenRouterOutput?
}

// MARK: - RegistrationScreenRouterInput
extension OnboardingScreenRouter: OnboardingScreenRouterInput {
    func routeToGenderViewController() {
        let registrationViewController = OnboardingScreenGenderAssembly.assemble().viewController
        viewController?
            .navigationController?
            .pushViewController(
                registrationViewController,
                animated: true
            )
    }
}

// MARK: - Private methods
extension OnboardingScreenRouter {
}
