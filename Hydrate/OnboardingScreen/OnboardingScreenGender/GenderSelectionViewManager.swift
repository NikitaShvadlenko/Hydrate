import UIKit

protocol GenderSelectionViewManagerProtocol {
    var genders: [Gender] { get }
}

protocol GenderSelectionViewManagerDelegate: AnyObject {
    func genederSelectionViewManager(
        _ genederSelectionViewManager: GenderSelectionViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    )
}

class GenderSelectionViewManager: NSObject {
    weak var delegate: GenderSelectionViewManagerDelegate?
}

extension GenderSelectionViewManager: GenderSelectionViewManagerProtocol {
    var genders: [Gender] {
        Gender.allCases
    }

}

extension GenderSelectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Gender.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(GenderSelectionCell.self)",
            for: indexPath
        ) as? GenderSelectionCell else {
            fatalError("failed to deqeue cell")
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.genederSelectionViewManager(self, didSelectItemAt: indexPath)

        if let selectedCell = collectionView.cellForItem(at: indexPath) as? GenderSelectionCell {
            let cells = collectionView.visibleCells as? [GenderSelectionCell]
            cells?.forEach { cell in
                if cell != selectedCell {
                    cell.isCellSelected = false
                }
            }
            selectedCell.isCellSelected.toggle()
        }
    }
}

extension GenderSelectionViewManager: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let numberOfCells: CGFloat = CGFloat(Gender.allCases.count - 1)
        let spaceBetweenCards = Constants.spaceBetweenCards
        let availableWidth: CGFloat = collectionView.bounds.width
        - (spaceBetweenCards * numberOfCells) - (Constants.horizontalCardInsets * 2)
        let width = availableWidth / CGFloat(Gender.allCases.count)

        let height: CGFloat = collectionView.bounds.height - (Constants.verticalCardInsets * 2)

        return CGSize(width: width, height: height)
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
