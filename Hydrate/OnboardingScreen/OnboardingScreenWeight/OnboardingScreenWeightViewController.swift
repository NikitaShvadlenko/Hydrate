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

    func setWeightViewDelegate(delegate: WeightSelectionViewDelegate) {
        onboardingScreenWeightView.weightSelectionView.delegate = delegate
    }
}

// MARK: - OnboardingScreenWeightViewInput
extension OnboardingScreenWeightViewController: OnboardingScreenWeightViewInput {
    func configureViews() {
    }
}

// MARK: - OnboardingScreenChildController
extension OnboardingScreenWeightViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.next
    }

    func viewDidPressNextButton() {
        print("ViewPressedNextButton")
    }
}

// MARK: - WeightSelectionViewDelegate
extension OnboardingScreenWeightViewController: WeightSelectionViewDelegate {
    func segmentedControlDidSelectDimension(_ segmentedControl: UISegmentedControl, dimension: Dimension) {
        presenter?.viewDidSelectMassDimension(dimension)
    }

    func toolbarDoneButtonPressed(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}

// MARK: - Private methods
extension OnboardingScreenWeightViewController {
}
