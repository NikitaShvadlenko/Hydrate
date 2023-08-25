//
//  MainScreenCollectionViewManager.swift
//  Hydrate
//
//  Created by Nikita Shvad on 24.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

struct HydrationViewModel: Hashable {
    let id = UUID()
    let amount = 1500
}

enum CollectionViewSection: CaseIterable {
    case statusView
    case calendar
}

protocol ManagesMainScreen {
    var dataSource: UICollectionViewDiffableDataSource<CollectionViewSection, HydrationViewModel> { get }
    func setCollectionView(_ collectionView: UICollectionView)
    func generateLayout() -> UICollectionViewLayout
    func configureSnapshot()
}

protocol MainScreenManagerDelegate: AnyObject {

}

final class MainScreenManager: NSObject {
    var hydrationViewModel = [HydrationViewModel(), HydrationViewModel()]
    weak var delegate: MainScreenManagerDelegate?
    weak var collectionView: UICollectionView?
    lazy var dataSource: UICollectionViewDiffableDataSource<CollectionViewSection, HydrationViewModel> = {
        guard let collectionView = self.collectionView else {
            fatalError("CollectionView was not set")
        }

        let cellRegistration = UICollectionView
            .CellRegistration<MainScreenInfoCell, HydrationViewModel> { (cell, indexPath, _) in
                let section = CollectionViewSection.allCases[indexPath.section]
                switch section {
                case .statusView:
                    cell.configure(.blue)
                case .calendar:
                    cell.configure(.red)
                }
            }

        return UICollectionViewDiffableDataSource<CollectionViewSection, HydrationViewModel>(
            collectionView: collectionView
            // swiftlint:disable line_length
        ) { (collectionView: UICollectionView, indexPath: IndexPath, item: HydrationViewModel) -> UICollectionViewCell? in

            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: item
            )
        }
    }()
}

extension MainScreenManager: ManagesMainScreen {
    func setCollectionView(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
    }

    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {[weak self] (sectionIndex: Int, _) -> NSCollectionLayoutSection? in
            let sectionLayoutKind = CollectionViewSection.allCases[sectionIndex]
            return self?.generateLayoutForSectionKind(sectionLayoutKind)
        }
        return layout
    }

    func configureSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<CollectionViewSection, HydrationViewModel>()
        snapshot.appendSections(CollectionViewSection.allCases)

        snapshot.appendItems([hydrationViewModel[0]], toSection: .statusView)
        snapshot.appendItems([hydrationViewModel[1]], toSection: .calendar)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - Private Methods
extension MainScreenManager {
    private func generateLayoutForSectionKind(_ sectionKind: CollectionViewSection) -> NSCollectionLayoutSection {
        switch sectionKind {
        case .statusView:
          return  hydrationSection()
        case .calendar:
            return calendarSection()
        }
    }

    private func hydrationSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.78)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize, subitems: [item]
        )
        // content insets

        let section = NSCollectionLayoutSection(group: group)

        return section
    }

    private func calendarSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(400)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize, subitems: [item]
        )
        // content insets

        let section = NSCollectionLayoutSection(group: group)

        return section
    }
}
