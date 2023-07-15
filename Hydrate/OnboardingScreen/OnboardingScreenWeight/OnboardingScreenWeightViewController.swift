import UIKit

final class OnboardingScreenWeightViewController: UIViewController {

    weak var delegate: OnboardingController?

    private let onboardingScreenWeightView = OnboardingScreenWeightView()

    var presenter: OnboardingScreenWeightViewOutput?

    override func loadView() {
        view = onboardingScreenWeightView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setOnboardingDelegate()
    }
}

// MARK: - OnboardingScreenWeightViewInput
extension OnboardingScreenWeightViewController: OnboardingScreenWeightViewInput {
    func configureViews() {
    }
}

// MARK: -
extension OnboardingScreenWeightViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.next
    }

    func viewDidPressNextButton() {
        print("ViewPressedNextButton")
    }
}

// MARK: - Private methods
extension OnboardingScreenWeightViewController {
}
