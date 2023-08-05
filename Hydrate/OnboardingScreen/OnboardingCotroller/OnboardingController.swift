import UIKit

protocol OnboardingController: UIViewController {
    func viewDidSelectOption()
    func viewDidDeselectOption()
    
    func childDidChooseActivityLevel(_ child: OnboardingChildController, activityLevel: ActivityLevel)
    func childDidChooseGender(_ child: OnboardingChildController, gender: Gender)
    func childDidChooseTheme(_ child: OnboardingChildController, theme: Theme)
    func childDidChooseGoal(_ child: OnboardingChildController, goal: Double, preferredUnits: Dimension)
    func childDidChooseWeight(_ child: OnboardingChildController, weight: Double, preferredUnits: Dimension)
    func childDidRequestGoal(_ child: OnboardingChildController, for unitsOfMeasurement: Dimension) -> Double

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
