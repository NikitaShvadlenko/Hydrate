import UIKit

final class OnboardingScreenGenderViewController: UIViewController {

    private let onboardingScreenGenderView = OnboardingScreenGenderView()

    var presenter: OnboardingScreenGenderViewOutput?

    override func loadView() {
        view = onboardingScreenGenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        navigationItem.hidesBackButton = true
    }
}

// MARK: - OnboardingScreenGenderViewInput
extension OnboardingScreenGenderViewController: OnboardingScreenGenderViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderViewController {
}
