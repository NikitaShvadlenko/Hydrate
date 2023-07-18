import UIKit

class ActivitySelectionCell: UICollectionViewCell {

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

    private lazy var activityImageView: UIImageView = {
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
extension ActivitySelectionCell {
    private func setupView() {
        layer.cornerRadius = 10
        [
            selectionBox,
            activityImageView
        ].forEach(addSubview(_:))
        selectionBox.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }

        activityImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(selectionBox.snp.leading).offset(-8)
        }
    }
}
