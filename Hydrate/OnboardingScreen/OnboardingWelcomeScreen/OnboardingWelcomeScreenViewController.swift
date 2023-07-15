import UIKit

final class OnboardingWelcomeScreenViewController: UIViewController {

    private let onboardingWelcomeScreenView = OnboardingWelcomeScreenView()
    weak var delegate: OnboardingController?

    var presenter: OnboardingWelcomeScreenViewOutput?

    override func loadView() {
        view = onboardingWelcomeScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setOnboardingDelegate()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        delegate?.viewDidSelectOption()
    }
}

// MARK: - OnboardingWelcomeScreenViewInput
extension OnboardingWelcomeScreenViewController: OnboardingWelcomeScreenViewInput {
    func configureViews() {
    }
}
// MARK: - OnboardingChildController
extension OnboardingWelcomeScreenViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.start
    }

    func viewDidPressNextButton() {
    }
}
// MARK: - Private methods
extension OnboardingWelcomeScreenViewController {
}
