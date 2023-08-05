import UIKit

final class ThemeSelectionCell: SelectionCollectionViewCell {

    private lazy var themeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellView(mainContentView: themeImageView, cellStyle: .horizontal, cornerRadius: 10)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private methods
extension ThemeSelectionCell {

}
