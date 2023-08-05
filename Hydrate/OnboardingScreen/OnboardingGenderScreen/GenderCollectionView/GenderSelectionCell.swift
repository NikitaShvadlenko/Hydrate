import UIKit

final class GenderSelectionCell: SelectionCollectionViewCell {

    private lazy var genderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellView(mainContentView: genderImageView, cellStyle: .horizontal, cornerRadius: 10)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
