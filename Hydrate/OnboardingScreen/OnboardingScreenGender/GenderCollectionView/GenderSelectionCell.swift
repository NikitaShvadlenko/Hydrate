import UIKit

class GenderSelectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

extension GenderSelectionCell {
    private func setupView() {
        contentView.backgroundColor = .green
    }
}
