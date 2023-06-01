import UIKit
import SnapKit

final class HydrationProgressView: UIView {

    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .center
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var varianceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: Public Methods
extension HydrationProgressView {
    public func configureView(
        percentage: Double,
        amount: Measurement<UnitVolume>,
        variance: Measurement<UnitVolume>) {
            percentageLabel.text = "\(percentage)%"
            amountLabel.text = "\(amount)"
            varianceLabel.text = "\(variance)"
        }
}

// MARK: Private methods
extension HydrationProgressView {
    private func setupView() {
        backgroundColor = .clear
        addSubview(stackView)
        [
            percentageLabel,
            amountLabel,
            varianceLabel
        ].forEach(stackView.addArrangedSubview)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
