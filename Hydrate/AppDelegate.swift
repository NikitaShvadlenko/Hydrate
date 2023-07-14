import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let container = CoreDataService.shared.container
            let window = UIWindow(frame: UIScreen.main.bounds)
            let tabBarController = UITabBarController()
            window.rootViewController = tabBarController
            var viewControllers = [UIViewController]()
            let mainScreenViewController = MainScreenAssembly.assemble(
                managedObjectContext: container.viewContext
            ).viewController
            let mainScreenNavigationController = UINavigationController(
                rootViewController: mainScreenViewController
            )
            // TODO: Customize tab bar
            viewControllers.append(mainScreenNavigationController)

            tabBarController.tabBar.tintColor = .black

            tabBarController.setViewControllers(viewControllers, animated: false)

            self.window = window
            window.makeKeyAndVisible()
        return true
    }
}
