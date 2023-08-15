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
}

extension SettingsCollectionViewManager: SettingsCollectionViewManagerProtocol {
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    func setCollectionView(_ collectionView: UICollectionView) {
        self.collecitonView = collectionView
    }

    var dataSource: UICollectionViewDiffableDataSource<SectionViewModel, CellViewModel> {
        // TODO: register multiple cell types when availible
        guard let collecitonView = self.collecitonView else {
            fatalError("CollectionView was not set")
        }

        let cellRegistration = UICollectionView
            .CellRegistration<NavigationListCell, CellViewModel> { (cell, _, item) in
                cell.configure(title: item.title, onTapAction: item.action)
        }

        return UICollectionViewDiffableDataSource<SectionViewModel, CellViewModel>(collectionView: collecitonView) {
            // swiftlint:disable closure_parameter_position
            // swiftlint:disable line_length
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: CellViewModel) -> UICollectionViewCell? in

            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: identifier
            )
        }
    }

    func configureSnapshot() {
        guard let sections = settingsViewModel?.sections else {
            return
        }
        var snapshot = NSDiffableDataSourceSnapshot<SectionViewModel, CellViewModel>()
        snapshot.appendSections(sections)
        sections.forEach {
            snapshot.appendItems($0.cells)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func setSettingsViewModel(with viewModel: SettingsViewModel) {
        self.settingsViewModel = viewModel
    }
}
