import UIKit

protocol ThemeSelectionViewManagerProtocol {
    var themes: [Theme] { get }
}

protocol ThemeSelectionViewManagerDelegate: AnyObject {
    func genederSelectionViewManager(
        _ genederSelectionViewManager: ThemeSelectionViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    )
}

class ThemeSelectionViewManager: NSObject {
    weak var delegate: ThemeSelectionViewManagerDelegate?
}

extension ThemeSelectionViewManager: ThemeSelectionViewManagerProtocol {
    var themes: [Theme] {
        Theme.allCases
    }

}

extension ThemeSelectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Theme.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(ThemeSelectionCell.self)",
            for: indexPath
        ) as? ThemeSelectionCell else {
            fatalError("failed to deqeue cell")
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.genederSelectionViewManager(self, didSelectItemAt: indexPath)

        if let selectedCell = collectionView.cellForItem(at: indexPath) as? ThemeSelectionCell {
            let cells = collectionView.visibleCells as? [ThemeSelectionCell]
            cells?.forEach { cell in
                if cell != selectedCell {
                    cell.isSelected = false
                }
            }
            selectedCell.isSelected = true
        }
    }
}

extension ThemeSelectionViewManager: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let numberOfCells: CGFloat = CGFloat(Theme.allCases.count - 1)
        let spaceBetweenCards = Constants.spaceBetweenCards
        let availableWidth: CGFloat = collectionView.bounds.width
        - (spaceBetweenCards * numberOfCells) - (Constants.horizontalCardInsets * 2)
        let width = availableWidth / CGFloat(Theme.allCases.count)

        let height: CGFloat = collectionView.bounds.height - (Constants.verticalCardInsets * 2)

        return CGSize(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        Constants.spaceBetweenCards
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        Constants.cardInsets
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
