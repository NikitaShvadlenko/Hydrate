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
    func segmentedControlDidSelectOption(_ segmentedControl: UISegmentedControl) {
        let itemIndex = segmentedControl.selectedSegmentIndex
        guard let symbol = segmentedControl.titleForSegment(at: itemIndex) else {
            fatalError("No symbol")
        }
        let selectedMeasurementUnit = convertSymbolIntoWightMeasurementUnit(symbol)
        presenter?.viewDidSelectMassMeasurementType(selectedMeasurementUnit)
    }

    func toolbarDoneButtonPressed(_ textField: UITextField) {
        textField.resignFirstResponder()
    }

    func convertSymbolIntoWightMeasurementUnit(_ symbol: String) -> WeightMeasurementUnit {
        let selectedMass = UnitMass(symbol: symbol)
        switch selectedMass.symbol {
        case UnitMass.kilograms.symbol:
            return .kilograms
        case UnitMass.pounds.symbol:
            return .pounds
        default:
            fatalError("wrong symbol")
        }
    }
}

// MARK: - Private methods
extension OnboardingScreenWeightViewController {
}
