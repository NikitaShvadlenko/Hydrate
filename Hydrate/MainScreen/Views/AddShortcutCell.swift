import UIKit
// TODO: refractor to use strategy pattern to create two types of ShortcutCells
final class AddShortcutCell: UICollectionViewCell {

    private let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Asset.primaryTextColor.color
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 1
        label.text = L10n.addShortcut
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Asset.progressViewProgressColor.color.withAlphaComponent(0.8)
        imageView.image = UIImage(sfSymbol: SFSymbol.plusCircle)?.withConfiguration(symbolConfiguration)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: Private methods
extension AddShortcutCell {
    private func setupView() {
        backgroundColor = Asset.progressViewProgressColor.color
            .withAlphaComponent(ShortcutCellConstants.backgroundAlpha)
        layer.borderColor = Asset.progressViewProgressColor.color.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = ShortcutCellConstants.cornerRadius

        [
            imageView,
            label
        ].forEach(addSubview(_:))

        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.width.equalTo(imageView.snp.height)
        }

        label.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }
    }
}
