import UIKit
import SnapKit

final class ShortcutCell: UICollectionViewCell {

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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var beverageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        image: UIImage,
        color: UIColor
    ) {
        contentView.layer.borderColor = color.cgColor
        contentView.backgroundColor = color.withAlphaComponent(ShortcutCellConstants.backgroundAlpha)
        nameLabel.text = name
        volumeLabel.text = volume
        volumeLabel.textColor = color
        beverageIcon.image = image
        beverageIcon.tintColor = color
    }
}

// MARK: Private methods
extension ShortcutCell {
    private func setupView() {
        [
            nameLabel,
            volumeLabel,
            beverageIcon
        ].forEach(addSubview(_:))

        contentView.layer.cornerRadius = ShortcutCellConstants.cornerRadius
        contentView.layer.borderWidth = ShortcutCellConstants.borderWidth

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(12)
            make.bottom.equalTo(volumeLabel.snp.top)
            make.height.equalTo(30)
        }

        volumeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(nameLabel.snp.bottom)
            make.bottom.equalToSuperview().inset(12)
        }

        beverageIcon.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(12)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
}

// MARK: - Constants
extension ShortcutCell {
    enum ShortcutCellConstants {
        static let borderWidth: CGFloat = 1
        static let cornerRadius: CGFloat = 14
        static let backgroundAlpha = 0.1
    }

}
