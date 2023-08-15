import UIKit
import SnapKit

final class SettingsScreenView: UIView {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension SettingsScreenView {
    private func configureViews() {
        backgroundColor = .red
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Public methods
extension SettingsScreenView {

}
