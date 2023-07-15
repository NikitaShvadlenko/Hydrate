import UIKit

final class OnboardingScreenViewController: UIViewController {

    private let onboardingScreenView = OnboardingScreenView()

    var presenter: OnboardingScreenViewOutput?
    var onboardingViewControllers: [OnboardingChildController]?
    var currentSelectedOnboardingViewController = -1
    var currentlyDisplayedView: UIView?

    override func loadView() {
        view = onboardingScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setOnboardingViewControllers()
        guard let onboardingViewControllers = onboardingViewControllers else { return }
        onboardingScreenView.pageView.setupNumberOfPages(onboardingViewControllers.count)
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

    func setBackButtonDelegate(_ backButtonDelegate: NavigationBackButtonDelegate) {
        onboardingScreenView.navigationBackButton.delegate = backButtonDelegate
    }

    func setNextButtonDelegate(delegate: NavigationNextButtonDelegate) {
        onboardingScreenView.navigationNextButton.delegate = delegate
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
        currentlyDisplayedView?.removeFromSuperview()
        if currentSelectedOnboardingViewController < 0 {
            onboardingScreenView.hideBackButton()
        } else {
            onboardingScreenView.displayBackButton()
        }

        guard let onboardingViewControllers = onboardingViewControllers else { return }
        currentSelectedOnboardingViewController += navigationDirection.rawValue
        if currentSelectedOnboardingViewController < onboardingViewControllers.count {
            let newOnboardingViewController = onboardingViewControllers[currentSelectedOnboardingViewController]
            onboardingScreenView.pageView.pageSelected(pageIndex: currentSelectedOnboardingViewController)
            addChild(newOnboardingViewController)
            currentlyDisplayedView = newOnboardingViewController.view
            guard let currentlyDisplayedView = currentlyDisplayedView else {
                return
            }
            onboardingScreenView.addSubview(currentlyDisplayedView)
            currentlyDisplayedView.snp.makeConstraints { make in
                make.top.equalTo(onboardingScreenView.safeAreaLayoutGuide.snp.top).inset(70)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalTo(onboardingScreenView.navigationNextButton.snp.top)
            }
        } else {
            presenter?.viewDidCompleteOnboarding(self)
        }
    }

    func setOnboardingViewControllers() {
        guard let genderController = OnboardingScreenGenderAssembly.assemble().viewController
                as? OnboardingChildController else {
            fatalError("Gender controller does not conform to OnboardingChildCOntroller protocol")
        }
        onboardingViewControllers = [genderController]
    }

    func removeChildrenViewControllers() {
        if children.count != 0 {
            for child in children {
                child.removeFromParent()
            }
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
        onboardingViewControllers?[currentSelectedOnboardingViewController].viewDidPressNextButton()
        navigateToNextOnboardingViewController(navigationDirection: .forward)
    }
}

// MARK: - OnboardingController
extension OnboardingScreenViewController: OnboardingController {
    func viewDidSelectOption() {
        onboardingScreenView.displayNextButton()
    }
}

enum NavigationDirection: Int {
    case backward = -1
    case forward = 1
}
