//
//  MainScreenCollectionViewManager.swift
//  Hydrate
//
//  Created by Nikita Shvad on 24.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

struct HydrationViewModel: Hashable {
    let amount = 1500
}

enum CollectionViewSection: CaseIterable {
    case topBar
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
    var hydrationViewModel = HydrationViewModel()
    weak var delegate: MainScreenManagerDelegate?
    weak var collectionView: UICollectionView?
    lazy var dataSource: UICollectionViewDiffableDataSource<CollectionViewSection, HydrationViewModel> = {
        guard let collectionView = self.collectionView else {
            fatalError("CollectionView was not set")
        }

        let cellRegistration = UICollectionView
            .CellRegistration<MainScreenCell, HydrationViewModel> { (cell, indexPath, item) in
                let section = CollectionViewSection.allCases[indexPath.section]
                print(section)
                switch section {
                case .topBar:
                    cell.configure(UIView())
                }
            }

        return UICollectionViewDiffableDataSource<CollectionViewSection, HydrationViewModel>(
            collectionView: collectionView
            // swiftlint:disable line_length
        ) { (collectionView: UICollectionView, indexPath: IndexPath, identifier: HydrationViewModel) -> UICollectionViewCell? in

            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: identifier
            )
        }
    }()
}

extension MainScreenManager: ManagesMainScreen {
    func setCollectionView(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
    }

    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, _) -> NSCollectionLayoutSection? in
            let sectionLayoutKind = CollectionViewSection.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .topBar:
                return self.generateTopBarLayout()
            }
        }
        return layout
    }

     func configureSnapshot() {
        let section = CollectionViewSection.topBar
        var snapshot = NSDiffableDataSourceSnapshot<CollectionViewSection, HydrationViewModel>()
        snapshot.appendSections([section])
         snapshot.appendItems([hydrationViewModel])
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - Private Methods
extension MainScreenManager {
    func generateTopBarLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(54)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
