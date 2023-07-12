import UIKit

protocol GenderSelectionViewManagerProtocol {

}

class GenderSelectionViewManager: NSObject {}

extension GenderSelectionViewManager: GenderSelectionViewManagerProtocol {

}

extension GenderSelectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Genders.allCases.count
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
}

extension GenderSelectionViewManager: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let numberOfCells: CGFloat = CGFloat(Genders.allCases.count - 1)
        let spaceBetweenCards = Constants.spaceBetweenCards
        let availableWidth: CGFloat = collectionView.bounds.width
        - (spaceBetweenCards * numberOfCells) - (Constants.horizontalCardInsets * 2)
        let width = availableWidth / CGFloat(Genders.allCases.count)

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

enum Genders: CaseIterable {
    case male
    case female
    case other
}
