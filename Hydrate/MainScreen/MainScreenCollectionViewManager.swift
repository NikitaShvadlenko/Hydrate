//
//  MainScreenCollectionViewManager.swift
//  Hydrate
//
//  Created by Nikita Shvad on 24.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

struct MainScreenViewModel: Hashable {
    let identificator = UUID()
//    let hydrationViewModel: HydrationViewModel
//    let shortcuts: ShortcutViewModel

    static func == (lhs: MainScreenViewModel, rhs: MainScreenViewModel) -> Bool {
        lhs.identificator == rhs.identificator
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identificator)
    }
}

enum CollectionViewSection: CaseIterable {
    case statusView
    case shortcuts
    case calendar
}

protocol ManagesMainScreen {
    var dataSource: UICollectionViewDiffableDataSource<CollectionViewSection, MainScreenViewModel> { get }
    func setCollectionView(_ collectionView: UICollectionView)
    func generateLayout() -> UICollectionViewLayout
    func configureSnapshot()
}

protocol MainScreenManagerDelegate: AnyObject {

}

final class MainScreenManager: NSObject {
    var hydrationViewModel: [MainScreenViewModel] = [MainScreenViewModel(), MainScreenViewModel(), MainScreenViewModel()]
    weak var delegate: MainScreenManagerDelegate?
    weak var collectionView: UICollectionView?
    lazy var dataSource: UICollectionViewDiffableDataSource<CollectionViewSection, MainScreenViewModel> = {
        guard let collectionView = self.collectionView else {
            fatalError("CollectionView was not set")
        }
        return UICollectionViewDiffableDataSource<CollectionViewSection, MainScreenViewModel>(
            collectionView: collectionView
            // swiftlint:disable line_length
        ) { (collectionView: UICollectionView, indexPath: IndexPath, item: MainScreenViewModel) -> UICollectionViewCell? in

            let section = CollectionViewSection.allCases[indexPath.section]
            switch section {
            case .statusView:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainScreenInfoCell.self)", for: indexPath) as? MainScreenInfoCell
                else { fatalError("Could not dequeue cell") }
                return cell
            case .shortcuts:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ShortcutCell.self)", for: indexPath) as? ShortcutCell
                else { fatalError("Could not dequeue cell") }
                return cell
            case .calendar:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CalendarCell.self)", for: indexPath) as? CalendarCell
                else { fatalError("Could not dequeue cell") }
                return cell
            }
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
        var snapshot = NSDiffableDataSourceSnapshot<CollectionViewSection, MainScreenViewModel>()
     //   guard let hydrationViewModel else { return }
        snapshot.appendSections(CollectionViewSection.allCases)

        snapshot.appendItems([hydrationViewModel[0]], toSection: .statusView)
        snapshot.appendItems([hydrationViewModel[1]], toSection: .calendar)
        snapshot.appendItems([hydrationViewModel[2]], toSection: .shortcuts)

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
        case .shortcuts:
            return shortcutsSection()
        }
    }

    private func hydrationSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.58)
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

    private func shortcutsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(100),
            heightDimension: .absolute(100))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.2)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}
