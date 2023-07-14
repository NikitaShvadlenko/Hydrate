import UIKit

final class OnboardingScreenViewController: UIViewController {

    private let onboardingScreenView = OnboardingScreenView()

    var presenter: OnboardingScreenViewOutput?
    var onboardingViewControllers: [UIViewController]?
    var currentSelectedOnboardingViewController = -1

    override func loadView() {
        view = onboardingScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        presenter?.viewDidLoad(self)
        setOnboardingViewControllers()
        presentNextOnboardingViewController()
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
}

// MARK: - RegistrationScreenViewInput
extension OnboardingScreenViewController: OnboardingScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension OnboardingScreenViewController {
    func presentNextOnboardingViewController() {
        guard let onboardingViewControllers = onboardingViewControllers else { return }
        let numberOfOnboardingViewControllers = onboardingViewControllers.count
        onboardingScreenView.pageView.setupNumberOfPages(numberOfOnboardingViewControllers)
        removeChildrenViewControllers()
        currentSelectedOnboardingViewController += 1
        onboardingScreenView.pageView.pageSelected(pageIndex: currentSelectedOnboardingViewController)

        let newOnboardingViewController = onboardingViewControllers[currentSelectedOnboardingViewController]
        addChild(newOnboardingViewController)
        onboardingScreenView.addSubview(newOnboardingViewController.view)
        newOnboardingViewController.view.snp.makeConstraints { make in
            make.top.equalTo(onboardingScreenView.safeAreaLayoutGuide.snp.top).inset(70)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(onboardingScreenView.pageView.snp.top)
        }
    }

    func setOnboardingViewControllers() {
        onboardingViewControllers = [OnboardingScreenGenderAssembly.assemble().viewController]
    }

    func removeChildrenViewControllers() {
        if children.count != 0 {
            for child in children {
                child.removeFromParent()
            }
        }
    }
}

extension OnboardingScreenViewController: NavigationBackButtonDelegate {
    func viewDidPressBackNavigationButton() {
        print("Button Pressed")
    }
}
