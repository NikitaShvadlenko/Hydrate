import UIKit

final public class NavigationListCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension NavigationListCell {
    public func configureCell(title: String, onTapAction: () -> Void) {

    }
}

// MARK: - Private methods
extension NavigationListCell {
    private func setupView() {

    }
}
