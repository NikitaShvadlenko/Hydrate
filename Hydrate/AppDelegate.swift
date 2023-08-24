import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let container = CoreDataService.shared.container

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = createTabBarController()
        setTabBarAppearence(tabBarController: tabBarController)
        window.rootViewController = tabBarController

        self.window = window
        window.makeKeyAndVisible()
        return true
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        var viewControllers = [UIViewController]()
        let settingsViewController = SettingsScreenAssembly.assemble().viewController
        let mainScreenViewController = MainScreenAssembly.assemble(
            managedObjectContext: container.viewContext
        ).viewController
        let mainScreenNavigationController = UINavigationController(rootViewController: mainScreenViewController)
        viewControllers = [mainScreenNavigationController, settingsViewController]
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.selectedViewController = mainScreenNavigationController

        settingsViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.settings,
            image: UIImage(sfSymbol: SFSymbol.settings),
            selectedImage: UIImage(sfSymbol: SFSymbol.settings)
        )

        mainScreenViewController.tabBarItem = UITabBarItem(
            title: L10n.TabBar.main,
            image: UIImage(sfSymbol: SFSymbol.waterDrop),
            selectedImage: UIImage(sfSymbol: SFSymbol.waterDrop)
        )

        return tabBarController
    }

    private func setTabBarAppearence(tabBarController: UITabBarController) {
        let tabBarAppearance = UITabBarAppearance()
        let tabBarScrollEdgeAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = Asset.tabBarColor.color
        tabBarScrollEdgeAppearance.backgroundColor = Asset.tabBarScrollEdgeColor.color
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarScrollEdgeAppearance
        UITabBar.appearance().tintColor = .white
        setUnselectedStackedItemsColor(
            normal: tabBarAppearance,
            edge: tabBarScrollEdgeAppearance,
            color: .black
        )
    }

    // there was no cleaner way to change unselected appearance
    private func setUnselectedStackedItemsColor(
        normal normalAppearance: UITabBarAppearance,
        edge scrollEdgeAppearance: UITabBarAppearance,
        color: UIColor
    ) {
        normalAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: color]
        normalAppearance.stackedLayoutAppearance.normal.iconColor = color
        scrollEdgeAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: color
        ]
        scrollEdgeAppearance.stackedLayoutAppearance.normal.iconColor = color
    }
}
