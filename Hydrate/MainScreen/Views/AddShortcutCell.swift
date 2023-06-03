import UIKit
// TODO: refractor to use strategy pattern to create two types of ShortcutCells
class AddShortcutCell: UICollectionViewCell {

    private let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Asset.primaryTextColor.color
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = L10n.addShortcut
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Asset.progressViewBaseColor.color
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
        backgroundColor = Asset.progressViewBaseColor.color.withAlphaComponent(ShortcutCellConstants.backgroundAlpha)
        tintColor = Asset.progressViewBaseColor.color
        layer.cornerRadius = ShortcutCellConstants.cornerRadius

        [
            imageView,
            label
        ].forEach(addSubview(_:))

        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
        }
    }
}
