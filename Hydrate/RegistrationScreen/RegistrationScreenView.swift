import UIKit

final class RegistrationScreenView: UIView {

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = Asset.secondaryTextColor.color
        textField.textAlignment = .center
        textField.contentVerticalAlignment = .bottom
        textField.borderStyle = .none
        textField.tintColor = Asset.secondaryTextColor.color
        textField.returnKeyType = .done
        textField.attributedPlaceholder = NSMutableAttributedString(
            string: L10n.RegistrationScreen.namePlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: Asset.secondaryTextColor.color]
            )
        return textField
    }()

    private lazy var unitsOfMeasurementLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var exerciseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var measurementPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension RegistrationScreenView {
    private func configureViews() {
        backgroundColor = Asset.backgroundColor.color
        welcomeLabel.text = L10n.RegistrationScreen.setupPlan
        nameLabel.text = L10n.RegistrationScreen.name
        addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
}
