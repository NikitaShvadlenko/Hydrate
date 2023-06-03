import UIKit
import SnapKit

class ShortcutsView: UIView {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        // TODO: create a custom cell and data source
        collectionView.dataSource = self
        collectionView.register(ShortcutCell.self, forCellWithReuseIdentifier: "\(ShortcutCell.self)")
        return collectionView
    }()

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Constants.spaceBetweenCards
        flowLayout.minimumLineSpacing = Constants.spaceBetweenCards
        flowLayout.sectionInset = Constants.cardInsets
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ShortcutsView: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let availableWidth = bounds.width - (Constants.spaceBetweenCards * (Constants.numberOfColumns - 1))
        - (Constants.horizontalCardInsets * 2)
        let width = availableWidth / Constants.numberOfColumns

        let availableHeight = bounds.height - (Constants.spaceBetweenCards * (Constants.numberOfRows - 1))
        - (Constants.verticalCardInsets * 2)
        let height = availableHeight / Constants.numberOfRows

        return CGSize(width: width, height: height)
    }

    private enum Constants {
        static let spaceBetweenCards: CGFloat = 10
        static let horizontalCardInsets: CGFloat = 10
        static let verticalCardInsets: CGFloat = 10
        static let cardInsets = UIEdgeInsets(
            top: verticalCardInsets,
            left: horizontalCardInsets,
            bottom: verticalCardInsets,
            right: horizontalCardInsets
        )
        static let numberOfRows: CGFloat = 2
        static let numberOfColumns: CGFloat = 2
    }

}

// MARK: - Public Methods
extension ShortcutsView {
    var dataSource: UICollectionViewDataSource? {
        get {
            collectionView.dataSource
        }
        set {
            collectionView.dataSource = newValue
        }
    }

    func reloadCollection() {
        collectionView.reloadData()
    }
}

// MARK: Private Methods
extension ShortcutsView {
    private func setupView() {
        self.backgroundColor = .clear
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ShortcutsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ShortcutCell.self)", for: indexPath) as? ShortcutCell else {
            fatalError("Failed to deque cell")
        }
        cell.configureCell(name: "Water", volume: "12oz", image: Asset.screenshot20230520At003206.image , color: .systemBlue)

        return cell
    }
}
