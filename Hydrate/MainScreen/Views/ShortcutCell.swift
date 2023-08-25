import UIKit
import SnapKit

final class ShortcutCell: UICollectionViewCell {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(stackView)
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, volumeLabel])
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Asset.primaryTextColor.color
        return label
    }()

    private lazy var volumeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
// MARK: Public Methods
extension ShortcutCell {
    public func configureCell(
        name: String,
        volume: String,
        color: UIColor
    ) {
        containerView.backgroundColor = color
        contentView.layer.borderColor = color.cgColor.copy(alpha: ShortcutCellConstants.borderAlpha)
        nameLabel.text = name
        volumeLabel.text = volume
    }
}

// MARK: Private methods
extension ShortcutCell {
    private func setupView() {
        contentView.layer.cornerRadius = ShortcutCellConstants.cornerRadius
        contentView.layer.borderWidth = ShortcutCellConstants.borderWidth
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(ShortcutCellConstants.borderWidth)
        }

        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(29)
        }

    }
}

// MARK: - Constants
extension ShortcutCell {
    enum ShortcutCellConstants {
        static let borderWidth: CGFloat = 3
        static let cornerRadius: CGFloat = 10
        static let borderAlpha = 0.5
    }

}
