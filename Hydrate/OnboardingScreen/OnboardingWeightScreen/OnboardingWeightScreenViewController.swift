import UIKit

final class OnboardingWeightScreenViewController: UIViewController {

    weak var delegate: OnboardingController?

    private let onboardingWeightScreenView = OnboardingWeightScreenView()

    var presenter: OnboardingWeightScreenViewOutput?

    override func loadView() {
        view = onboardingWeightScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setOnboardingDelegate()
        onboardingWeightScreenView.weightSelectionView.selectFirstSegmentedControlElement()
        registerDismissKeyboardWhenTouchOutside()
    }

    func setWeightViewDelegate(delegate: WeightSelectionViewDelegate) {
        onboardingWeightScreenView.weightSelectionView.delegate = delegate
    }
}

// MARK: - OnboardingWeightScreenViewInput
extension OnboardingWeightScreenViewController: OnboardingWeightScreenViewInput {
    func setWeight(weight: Double, dimension: Dimension) {
        delegate?.childDidChooseWeight(self, weight: weight, preferredUnits: dimension)
    }

    func configureViews() {
    }
}

// MARK: - OnboardingScreenChildController
extension OnboardingWeightScreenViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.next
    }

    func viewDidPressNextButton() {
        presenter?.viewDidPressNextButton(self)
    }
}

// MARK: - WeightSelectionViewDelegate
extension OnboardingWeightScreenViewController: WeightSelectionViewDelegate {
    func segmentedControlDidSelectDimension(_ segmentedControl: UISegmentedControl, dimension: Dimension) {
        presenter?.viewDidSelectMassDimension(self, dimension)
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let decimalSeparator = NumberFormatter().decimalSeparator else {
            fatalError("could not create decimal separator")
        }

        let currentText = textField.text ?? ""

        if currentText.count > 5 && !string.isEmpty {
            return false
        }

        let invalidCharacters =
        CharacterSet(charactersIn: ("0123456789" + decimalSeparator)).inverted
        return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard
            let text = textField.text,
            let weight = Double(text.replacingOccurrences(of: ",", with: "."))
        else {
            return
        }

        if weight > 10 && weight < 1500 {
            presenter?.viewDidInsertWeightValue(self, value: weight)
            delegate?.viewDidSelectOption()
        } else {
            delegate?.viewDidDeselectOption()
        }
    }
}

// MARK: - Private methods
extension OnboardingWeightScreenViewController {
}
