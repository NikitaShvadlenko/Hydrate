import UIKit

class WeightSelectionView: UIView {

    let backgroundContainerView = BackgroundContainerView()

    private lazy var textfield: UITextField = {
        let view = UITextField()
        view.keyboardType = .numberPad
        view.placeholder = "65"
        view.font = UIFont.systemFont(ofSize: 32)
        view.textAlignment = .center
        view.borderStyle = .none
        view.tintColor = .black
        
        return view
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [L10n.OnboardingScreen.pounds, L10n.OnboardingScreen.killograms])

        return segmentedControl
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textfield, segmentedControl])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
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

// MARK: - Private methods
extension WeightSelectionView {
    func setupView() {
        addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(stackView)

        backgroundContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
}
