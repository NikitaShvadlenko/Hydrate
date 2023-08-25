import UIKit
import SnapKit

final class MainScreenView: UIView {

    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.backgroundColor = .red
        collectionView.register(MainScreenInfoCell.self, forCellWithReuseIdentifier: "\(MainScreenInfoCell.self)")
        collectionView.register(ShortcutCell.self, forCellWithReuseIdentifier: "\(ShortcutCell.self)")
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "\(CalendarCell.self)")
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
extension MainScreenView {
    private func configureViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
