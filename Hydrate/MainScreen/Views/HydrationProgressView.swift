import UIKit
import SnapKit

final class HydrationProgressView: UIView {

    let circleView = CircleProgressView(
        baseColor: Asset.progressViewBaseColor.color,
        progressColor: Asset.progressViewProgressColor.color, lineWidth: 20
    )

    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var varianceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.alpha = 0.6
        label.textAlignment = .center
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.center = amountLabel.center
        circleView.snp.makeConstraints { make in
            make.centerY.equalTo(amountLabel.snp.centerY)
            make.edges.equalToSuperview().inset(20)
        }

        circleView.animateCircle(duration: 0.5, delay: 0)
    }
}
// MARK: Public Methods
extension HydrationProgressView {
    public func configureView(
        progress: Double,
        amount: Measurement<UnitVolume>,
        variance: Measurement<UnitVolume>) {
            percentageLabel.text = "\(progress * 100)%"
            amountLabel.text = "\(amount)"
            varianceLabel.text = "\(variance)"
            circleView.progress = CGFloat(progress)
        }
}

// MARK: Private methods
extension HydrationProgressView {
    private func setupView() {
        backgroundColor = .clear
        [
            percentageLabel,
            amountLabel,
            varianceLabel
        ].forEach(addSubview(_:))

        amountLabel.addSubview(circleView)

        amountLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(12)
        }

        percentageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(amountLabel.snp.top)
            make.leading.trailing.equalToSuperview()
        }

        varianceLabel.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
}
