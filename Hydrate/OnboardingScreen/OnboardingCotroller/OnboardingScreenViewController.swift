import UIKit

final class OnboardingScreenViewController: UIViewController {
    var presenter: OnboardingScreenViewOutput?
    private let onboardingScreenView = OnboardingScreenView()

    private var onboardingViewControllers: [OnboardingChildController]?
    private var selectedChildViewControllerIndex = -1
    private var currentlyDisplayedView: UIView?

    override func loadView() {
        view = onboardingScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setOnboardingViewControllers()
        guard let onboardingViewControllers = onboardingViewControllers else { return }
        onboardingScreenView.setNumberOfPages(numberOfPages: onboardingViewControllers.count)
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        presenter?.viewDidLoad(self)
        navigateToNextOnboardingViewController(navigationDirection: .forward)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }

    func setBackButtonDelegate(_ delegate: NavigationBackButtonDelegate) {
        onboardingScreenView.setBackButtonDelegate(delegate)
    }

    func setNextButtonDelegate(delegate: NavigationNextButtonDelegate) {
        onboardingScreenView.setNextButtonDelegate(delegate)
    }
}

// MARK: - RegistrationScreenViewInput
extension OnboardingScreenViewController: OnboardingScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension OnboardingScreenViewController {
    func navigateToNextOnboardingViewController(navigationDirection: NavigationDirection) {
        selectedChildViewControllerIndex += navigationDirection.rawValue
        removeChildrenViewControllers()
        currentlyDisplayedView?.removeFromSuperview()
        onboardingScreenView.disableNextButton()
        configureBackButton()
        guard let onboardingViewControllers = onboardingViewControllers else { return }
        if selectedChildViewControllerIndex < onboardingViewControllers.count {
            let newOnboardingViewController = onboardingViewControllers[selectedChildViewControllerIndex]
            setNavigationButtonTitle(newOnboardingViewController.navigationButtonTitle)
            onboardingScreenView.selectPage(selectedChildViewControllerIndex)
            addChild(newOnboardingViewController)
            currentlyDisplayedView = newOnboardingViewController.view

            guard let currentlyDisplayedView = currentlyDisplayedView else {
                return
            }

            UIView.transition(with: onboardingScreenView,
                              duration: 0.33,
                              options: [.curveEaseOut, .transitionCrossDissolve],
                              animations: {
                self.configureContainedView(currentlyDisplayedView)
            },
                              completion: nil
            )
        } else {
            presenter?.viewDidCompleteOnboarding(self)
        }
    }

    func setOnboardingViewControllers() {
        guard let genderController = OnboardingGenderScreenAssembly.assemble().viewController
                as? OnboardingChildController,
              let welcomeController = OnboardingWelcomeScreenAssembly.assemble().viewController
                as? OnboardingChildController,
              let weightController = OnboardingWeightScreenAssembly.assemble().viewController
                as? OnboardingChildController,
              let goalController = OnboardingGoalScreenAssembly.assemble().viewController
                as? OnboardingChildController,
              let themeController = OnboardingThemeScreenAssembly.assemble().viewController
                as? OnboardingChildController,
              let activityController = OnboardingActivityScreenAssembly.assemble().viewController
                as? OnboardingChildController
        else {
            fatalError("Gender controller does not conform to OnboardingChildCOntroller protocol")
        }
        onboardingViewControllers = [
            welcomeController,
            genderController,
            weightController,
            activityController,
            goalController,
            themeController
        ]
    }

    func removeChildrenViewControllers() {
        if children.count != 0 {
            for child in children {
                child.removeFromParent()
            }
        }
    }

    func configureContainedView(_ view: UIView) {
        onboardingScreenView.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.equalTo(onboardingScreenView.safeAreaLayoutGuide.snp.top).inset(70)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(onboardingScreenView.navigationNextButton.snp.top)
        }
    }

    func configureBackButton() {
        if selectedChildViewControllerIndex <= 0 {
            onboardingScreenView.hideBackButton()
        } else {
            onboardingScreenView.displayBackButton()
        }
    }
}

// MARK: - NavigationBackButtonDelegate
extension OnboardingScreenViewController: NavigationBackButtonDelegate {
    func viewDidPressBackNavigationButton() {
        navigateToNextOnboardingViewController(navigationDirection: .backward)
    }
}

// MARK: - NavigationNextButtonDelegate
extension OnboardingScreenViewController: NavigationNextButtonDelegate {
    func buttonPressed() {
        onboardingViewControllers?[selectedChildViewControllerIndex].viewDidPressNextButton()
        navigateToNextOnboardingViewController(navigationDirection: .forward)
    }
}

// MARK: - OnboardingController
extension OnboardingScreenViewController: OnboardingController {
    func childDidChooseActivityLevel(_ child: OnboardingChildController, activityLevel: ActivityLevel) {
        presenter?.viewDidChooseActivityLevel(self, activityLevel: activityLevel)
    }

    func childDidChooseGender(_ child: OnboardingChildController, gender: Gender) {
        presenter?.viewDidChooseGender(self, gender: gender)
    }

    func childDidChooseTheme(_ child: OnboardingChildController, theme: Theme) {
        presenter?.viewDidChooseTheme(self, theme: theme)
    }

    func childDidChooseGoal(_ child: OnboardingChildController, goal: Double, preferredUnits: Dimension) {
        presenter?.viewDidChooseGoal(self, goal: goal, preferredUnits: preferredUnits)
    }

    func childDidChooseWeight(
        _ child: OnboardingChildController,
        weight: Double,
        preferredUnits: Dimension
    ) {
        presenter?.viewDidChooseWeight(self, weight: weight, preferredUnits: preferredUnits)
    }

    func childDidRequestGoal(
        _ child: OnboardingChildController,
        for unitsOfMeasurement: Dimension
    ) -> Double {
        guard let goal = presenter?.viewDidRequestGoal(self, units: unitsOfMeasurement) else {
            fatalError("Presenter could not return goal")
        }
        return goal
    }

    func setNavigationButtonTitle(_ title: String) {
        onboardingScreenView.setNextButtonTitle(title)
    }

    func viewDidSelectOption() {
        onboardingScreenView.enableNextButton()
    }

    func viewDidDeselectOption() {
        onboardingScreenView.disableNextButton()
    }
}

enum NavigationDirection: Int {
    case backward = -1
    case forward = 1
}
