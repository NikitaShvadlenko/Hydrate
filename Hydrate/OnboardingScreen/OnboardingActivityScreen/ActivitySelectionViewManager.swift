import UIKit

protocol ActivitySelectionViewManagerProtocol {
    var activityLevels: [ActivityLevel] { get }
}

protocol ActivitySelectionViewManagerDelegate: AnyObject {
    func genederSelectionViewManager(
        _ genederSelectionViewManager: ActivitySelectionViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    )
}

class ActivitySelectionViewManager: NSObject {
    weak var delegate: ActivitySelectionViewManagerDelegate?
}

extension ActivitySelectionViewManager: ActivitySelectionViewManagerProtocol {
    var activityLevels: [ActivityLevel] {
        ActivityLevel.allCases
    }

}

extension ActivitySelectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ActivityLevel.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(ActivitySelectionCell.self)",
            for: indexPath
        ) as? ActivitySelectionCell else {
            fatalError("failed to deqeue cell")
        }
        let activityLevel = ActivityLevel.allCases[indexPath.item]
        cell.configureCell(for: activityLevel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.genederSelectionViewManager(self, didSelectItemAt: indexPath)

        if let selectedCell = collectionView.cellForItem(at: indexPath) as? ActivitySelectionCell {
            let cells = collectionView.visibleCells as? [ActivitySelectionCell]
            cells?.forEach { cell in
                if cell != selectedCell {
                    cell.isCellSelected = false
                }
            }
            selectedCell.isCellSelected = true
        }
    }
}

extension ActivitySelectionViewManager: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let numberOfCells: CGFloat = CGFloat(ActivityLevel.allCases.count - 1)
        let spaceBetweenCards = Constants.spaceBetweenCards

        let availibleHeight =
        collectionView.bounds.height -
        (spaceBetweenCards * numberOfCells) -
        (Constants.verticalCardInsets * 2)

        let height = availibleHeight / CGFloat(ActivityLevel.allCases.count)
        let width: CGFloat = collectionView.bounds.width - (Constants.horizontalCardInsets * 2)

        return CGSize(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        Constants.cardInsets
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        Constants.spaceBetweenCards
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
    }

}
