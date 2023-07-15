import UIKit

final class OnboardingWelcomeScreenViewController: UIViewController {

    private let onboardingWelcomeScreenView = OnboardingWelcomeScreenView()

    var presenter: OnboardingWelcomeScreenViewOutput?

    override func loadView() {
        view = onboardingWelcomeScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - OnboardingWelcomeScreenViewInput
extension OnboardingWelcomeScreenViewController: OnboardingWelcomeScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension OnboardingWelcomeScreenViewController {
}
