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
        presenter?.viewDidLoad(self)
        self.navigationItem.setHidesBackButton(true, animated: false)
        setOnboardingViewControllers()
        presentNextOnboardingViewController()
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
            make.top.leading.trailing.equalToSuperview()
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
