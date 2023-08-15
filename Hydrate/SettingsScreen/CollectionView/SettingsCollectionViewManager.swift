import UIKit

protocol SettingsCollectionViewManagerProtocol {
    func setSettingsViewModel(with viewModel: SettingsViewModel)
    func createLayout() -> UICollectionViewLayout
    var dataSource: UICollectionViewDiffableDataSource<SectionViewModel, CellViewModel> { get }
    func setCollectionView(_ collectionView: UICollectionView)
    func configureSnapshot()
}

final class SettingsCollectionViewManager: NSObject {
    var settingsViewModel: SettingsViewModel?
    weak var collecitonView: UICollectionView?
    lazy var dataSource: UICollectionViewDiffableDataSource<SectionViewModel, CellViewModel> = {
        guard let collectionView = self.collecitonView else {
            fatalError("CollectionView was not set")
        }

        let cellRegistration = UICollectionView
            .CellRegistration<NavigationListCell, CellViewModel> { (cell, _, item) in
                cell.configure(title: item.title, onTapAction: item.action)
            }

        let headerRegistration = UICollectionView.SupplementaryRegistration
        // swiftlint:disable line_length
        <SettingsHeaderView>(elementKind: UICollectionView.elementKindSectionHeader) { [weak self] (supplementaryView, _, indexPath) in
            supplementaryView.configureView(
                title: self?.settingsViewModel?
                    .sections[indexPath.section]
                    .sectionTitle ?? ""
            )
        }

        let dataSource = UICollectionViewDiffableDataSource<SectionViewModel, CellViewModel>(collectionView: collectionView) {
            // swiftlint:disable closure_parameter_position
            // swiftlint:disable line_length
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: CellViewModel) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: identifier
            )
        }
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration, for: index)
        }
        return dataSource
    }()
}

extension SettingsCollectionViewManager: SettingsCollectionViewManagerProtocol {
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 8,
            leading: 16,
            bottom: 18,
            trailing: 16
        )

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )

        section.boundarySupplementaryItems = [sectionHeader]
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }


    func setCollectionView(_ collectionView: UICollectionView) {
        self.collecitonView = collectionView
    }

    func configureSnapshot() {
        guard let sections = settingsViewModel?.sections else {
            return
        }
        var snapshot = NSDiffableDataSourceSnapshot<SectionViewModel, CellViewModel>()
        snapshot.appendSections(sections)
        sections.forEach {
            snapshot.appendItems($0.cells, toSection: $0)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func setSettingsViewModel(with viewModel: SettingsViewModel) {
        self.settingsViewModel = viewModel
    }
}
