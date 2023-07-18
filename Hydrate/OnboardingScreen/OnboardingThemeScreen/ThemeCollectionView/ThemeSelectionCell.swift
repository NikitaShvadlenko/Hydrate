import UIKit

class ThemeSelectionCell: UICollectionViewCell {

    public var isCellSelected: Bool = false {
        didSet {
            if isCellSelected {
                selectionBox.isSelected = true
            } else {
                prepareForReuse()
            }
        }
    }

    private var selectionBox = SelectionBox(width: 20)

    private lazy var themeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        selectionBox.isSelected = false
    }
}

// MARK: - Private methods
extension ThemeSelectionCell {
    private func setupView() {
        layer.cornerRadius = 10
        [
            selectionBox,
            themeImageView
        ].forEach(addSubview(_:))

        selectionBox.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        themeImageView.snp.makeConstraints { make in
            make.bottom.equalTo(selectionBox.snp.top).offset(-8)
            make.leading.trailing.top.equalToSuperview()
        }
    }
}
