import UIKit

class WeightSelectionView: UIView {

    let backgroundContainerView = BackgroundContainerView()
    let weightInputField = UITextField()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.alignment = .center
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
    }
}
