import UIKit

protocol WeightSelectionViewDelegate: UITextFieldDelegate {
    func segmentedControlDidSelectDimension(_ segmentedControl: UISegmentedControl, dimension: Dimension)
}

class WeightSelectionView: UIView {

    weak var delegate: WeightSelectionViewDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }

    let backgroundContainerView = BackgroundContainerView()

    private lazy var textField: UITextField = {
        let view = UITextField()
        view.keyboardType = .decimalPad
        view.placeholder = "65"
        view.font = UIFont.systemFont(ofSize: 32)
        view.textAlignment = .center
        view.borderStyle = .none
        view.tintColor = .black
        view.adjustsFontSizeToFitWidth = true
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(segmentedControl)
        return view
    }()

    private lazy var segmentedControl: DimensionSegmentedControl = {
        let segmentedControl = DimensionSegmentedControl(
            segmentedControlItems: [UnitMass.kilograms, UnitMass.pounds],
            dimensionType: .mass
        )
        segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlDidSelectOption),
            for: .primaryActionTriggered
        )
        return segmentedControl
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField, containerView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
// MARK: - Public methods
extension WeightSelectionView {
    public func selectFirstSegmentedControlElement() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControlDidSelectOption()
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
            make.width.equalTo(textField.snp.width)
            make.bottom.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(48)
            make.top.bottom.equalToSuperview().inset(40)
        }
        addBottomLine(to: textField)
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

    @objc
    func segmentedControlDidSelectOption() {
        let index = segmentedControl.selectedSegmentIndex
        let dimension = segmentedControl.segmentedControlItems[index]
        delegate?.segmentedControlDidSelectDimension(segmentedControl, dimension: dimension)
    }
}
