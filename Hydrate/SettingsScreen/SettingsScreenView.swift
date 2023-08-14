import UIKit
import SnapKit

final class SettingsScreenView: UIView {

    let collectionView = UICollectionView()

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
        backgroundColor = .white
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Public methods
extension SettingsScreenView {

}
