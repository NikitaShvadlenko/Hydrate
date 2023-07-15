import UIKit

protocol OnboardingController: UIViewController {
    func viewDidSelectOption()
}

protocol OnboardingChildController: UIViewController {
    func viewDidPressNextButton()
}
