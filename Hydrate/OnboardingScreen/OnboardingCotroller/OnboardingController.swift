import UIKit

protocol OnboardingController: UIViewController {
    func viewDidSelectOption()
    func setNavigationButtonTitle(_ title: String)
}

protocol OnboardingChildController: UIViewController {
    var delegate: OnboardingController? { get set }
    var navigationButtonTitle: String { get }
    func viewDidPressNextButton()
    func setOnboardingDelegate()
}

extension OnboardingChildController {
    func setOnboardingDelegate() {
        guard let parent = self.parent as? OnboardingController else {
            fatalError("No parent")
        }
        self.delegate = parent
    }
}
