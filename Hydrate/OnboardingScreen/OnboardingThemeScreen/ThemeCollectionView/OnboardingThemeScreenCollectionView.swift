import UIKit
import SnapKit

class OnboardingThemeScreenCollectionView: UIView {

    let containerView = BackgroundContainerView()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(ThemeSelectionCell.self, forCellWithReuseIdentifier: "\(ThemeSelectionCell.self)")
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

// MARK: - Public methods
extension OnboardingThemeScreenCollectionView {
    var dataSource: UICollectionViewDataSource? {
        get {
            collectionView.dataSource
        }
        set {
            collectionView.dataSource = newValue
        }
    }

    var delegate: UICollectionViewDelegate? {
        get {
            collectionView.delegate
        }
        set {
            collectionView.delegate = newValue
        }
    }

    func reloadCollection() {
        collectionView.reloadData()
    }
}

// MARK: - Private methods
extension OnboardingThemeScreenCollectionView {
    private func setupView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        containerView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private enum Constants {
        static let spaceBetweenCards: CGFloat = 10
        static let horizontalCardInsets: CGFloat = 16
        static let verticalCardInsets: CGFloat = 40
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
