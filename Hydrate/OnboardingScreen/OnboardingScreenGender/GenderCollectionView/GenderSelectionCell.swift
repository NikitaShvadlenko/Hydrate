import UIKit

class GenderSelectionCell: UICollectionViewCell {

    public var isCellSelected: Bool = false {
        didSet {
            if isCellSelected {
                backgroundColor = .blue
                genderImageView.alpha = 0.7
                selectionBox.isSelected = true
            } else {
                prepareForReuse()
            }
        }
    }

    private var selectionBox = SelectionBox(width: 20)

    private lazy var genderImageView: UIImageView = {
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
        genderImageView.alpha = 1
        selectionBox.isSelected = false
        backgroundColor = .clear
    }
}

// MARK: - Private methods
extension GenderSelectionCell {
    private func setupView() {
        layer.cornerRadius = 10
        [
            selectionBox,
            genderImageView
        ].forEach(addSubview(_:))

        selectionBox.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        genderImageView.snp.makeConstraints { make in
            make.bottom.equalTo(selectionBox.snp.top).offset(-8)
            make.leading.trailing.top.equalToSuperview()
        }
    }
}
