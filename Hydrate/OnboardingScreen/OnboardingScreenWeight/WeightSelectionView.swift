import UIKit

protocol WeightSelectionViewDelegate: UITextFieldDelegate {
    func segmentedControlDidSelectOption(_ segmentedControl: UISegmentedControl)
}

class WeightSelectionView: UIView {

    weak var delegate: WeightSelectionViewDelegate?

    let backgroundContainerView = BackgroundContainerView()

    private lazy var textfield: UITextField = {
        let view = UITextField()
        view.keyboardType = .decimalPad
        view.placeholder = "65"
        view.font = UIFont.systemFont(ofSize: 32)
        view.textAlignment = .center
        view.borderStyle = .none
        view.tintColor = .black
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(segmentedControl)
        return view
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlDidSelectOption),
            for: .primaryActionTriggered
        )
        return segmentedControl
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textfield, containerView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSegmentedControlTitles()
        setupView()
        addToolbar()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private methods
extension WeightSelectionView {
    private func setupView() {
        addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(stackView)

        backgroundContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(textfield.snp.width)
            make.bottom.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(48)
            make.top.bottom.equalToSuperview().inset(40)
        }
        addBottomLine(to: textfield)
    }

    private func addBottomLine(to textField: UITextField) {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.black
        textField.addSubview(lineView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    private func configureSegmentedControlTitles() {
        let formatter = MeasurementFormatter()
        formatter.locale = Locale.current
        let currentUnitMass = UnitMass(forLocale: Locale.current)
        let kilogramSymbol = UnitMass.kilograms.symbol
        let poundSymbol = UnitMass.pounds.symbol
        switch currentUnitMass {
        case .kilograms:
            self.segmentedControl.insertSegment(withTitle: kilogramSymbol, at: 0, animated: false)
            self.segmentedControl.insertSegment(withTitle: poundSymbol, at: 1, animated: false)
        case .pounds:
            self.segmentedControl.insertSegment(withTitle: poundSymbol, at: 0, animated: false)
            self.segmentedControl.insertSegment(withTitle: kilogramSymbol, at: 1, animated: false)
        default:
            self.segmentedControl.insertSegment(withTitle: kilogramSymbol, at: 0, animated: false)
            self.segmentedControl.insertSegment(withTitle: poundSymbol, at: 1, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
    }

    private func addToolbar() {
        let toolbar = UIToolbar()
        let nextButtonContainerView = UIView()
        let navigationNextButton = NavigationNextButton()
        nextButtonContainerView.addSubview(navigationNextButton)

        let nextButtonInContainerView = UIBarButtonItem(customView: nextButtonContainerView)

        toolbar.items = [nextButtonInContainerView]
        navigationNextButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        toolbar.barTintColor = .
        toolbar.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        textfield.inputAccessoryView = toolbar
    }

    @objc
    func segmentedControlDidSelectOption() {
        delegate?.segmentedControlDidSelectOption(segmentedControl)
    }
}
