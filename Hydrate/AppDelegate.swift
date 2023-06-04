import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        createHydrationJournalContainer { container in
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

            UITabBarItem.appearance()
                .setTitleTextAttributes(
                    [NSAttributedString.Key.foregroundColor: UIColor.clear],
                    for: .normal
                )

            viewControllers.append(mainScreenNavigationController)

            tabBarController.setViewControllers(viewControllers, animated: false)

            self.window = window
            window.makeKeyAndVisible()
        }
        return true
    }
}
