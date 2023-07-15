import UIKit

final class OnboardingScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: OnboardingScreenRouterOutput?
}

// MARK: - RegistrationScreenRouterInput
extension OnboardingScreenRouter: OnboardingScreenRouterInput {
    func routeToMainScreen() {
        let mainScreenViewController = MainScreenAssembly.assemble(
            managedObjectContext: CoreDataService.shared.container.viewContext
        ).viewController

        viewController?
            .navigationController?
            .pushViewController(
                mainScreenViewController,
                animated: true
            )
    }
}

// MARK: - Private methods
extension OnboardingScreenRouter {
}
