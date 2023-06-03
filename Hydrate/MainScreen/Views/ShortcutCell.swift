import UIKit
import SnapKit

class ShortcutCell: UICollectionViewCell {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        contentView.backgroundColor = color.withAlphaComponent(0.1)
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

        contentView.layer.cornerRadius = 14
        contentView.layer.borderWidth = 1

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
        }

        volumeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(nameLabel.snp.bottom)
            make.bottom.equalToSuperview().inset(12)
        }

        beverageIcon.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(12)
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
}
