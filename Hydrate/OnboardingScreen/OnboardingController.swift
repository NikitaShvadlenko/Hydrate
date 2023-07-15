import UIKit

protocol OnboardingController: UIViewController {
    func viewDidSelectOption()
    func setNavigationButtonTitle(_ title: String)
}

protocol OnboardingChildController: UIViewController {
    var navigationButtonTitle: String { get }
    func viewDidPressNextButton()
}
