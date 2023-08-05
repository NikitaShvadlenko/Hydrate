import UIKit

final class OnboardingGoalScreenViewController: UIViewController {

    weak var delegate: OnboardingController?

    private let onboardingGoalScreenView = OnboardingGoalScreenView()

    var presenter: OnboardingGoalScreenViewOutput?

    override func loadView() {
        view = onboardingGoalScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        registerDismissKeyboardWhenTouchOutside()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        delegate?.viewDidSelectOption()
    }

    func setGoalViewDelegate(delegate: GoalSelectionViewDelegate) {
        onboardingGoalScreenView.goalSelectionView.delegate = delegate
    }
}

// MARK: - OnboardingGoalScreenViewInput
extension OnboardingGoalScreenViewController: OnboardingGoalScreenViewInput {
    func setGoal(goal: Double, dimension: Dimension) {
        delegate?.childDidChooseGoal(self, goal: goal, preferredUnits: dimension)
    }

    func requestGoal(for dimension: Dimension) -> Double {
        guard let goal = delegate?.childDidRequestGoal(self, for: dimension) else {
            fatalError("Failed to get the goal")
        }
        return goal
    }

    func updateGoal(goal: Double) {
        onboardingGoalScreenView.updateGoal(goal: goal)
    }

    func configureViews() {
        setOnboardingDelegate()
        onboardingGoalScreenView.goalSelectionView.selectFirstSegmentedControlElement()
    }
}

// MARK: - OnboardingScreenChildController
extension OnboardingGoalScreenViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.setGoal
    }

    func viewDidPressNextButton() {
        presenter?.viewDidPressNextButton(self)
    }
}

// MARK: - WeightSelectionViewDelegate
extension OnboardingGoalScreenViewController: GoalSelectionViewDelegate {
    func segmentedControlDidSelectDimension(_ segmentedControl: UISegmentedControl, dimension: Dimension) {
        presenter?.viewDidSelectGoalDimension(self, dimension)
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
            let volume = Double(text.replacingOccurrences(of: ",", with: "."))
        else {
            return
        }

        if volume > 1000 && volume < 9000 {
            presenter?.viewDidInsertVolumeValue(self, value: volume)
            delegate?.viewDidSelectOption()
        } else {
            delegate?.viewDidDeselectOption()
        }
    }
}

// MARK: - Private methods
extension OnboardingGoalScreenViewController {
}
