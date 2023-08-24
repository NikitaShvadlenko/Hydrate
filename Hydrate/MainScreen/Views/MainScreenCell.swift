import UIKit
import SnapKit

final class MainScreenCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension MainScreenCell {
    public func configure(_ view: UIView) {
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
