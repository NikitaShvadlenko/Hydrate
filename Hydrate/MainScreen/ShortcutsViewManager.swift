import UIKit
protocol ShortcutsViewManagerProtocol {
    var shortcuts: [Shortcut] { get set }
    var delegate: ShortcutsViewManagerDelegate? { get set }
}

protocol ShortcutsViewManagerDelegate: AnyObject {
    func shortcutsViewManager(
        _ shortcutsViewManager: ShortcutsViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    )

    func shortcutsViewManager(
        _ shortcutsViewManager: ShortcutsViewManagerProtocol,
        didCalculateNumberOfPages numberOfPages: Int
    )

    func shortcutsViewManager(
        _ shortcutsViewManager: ShortcutsViewManagerProtocol,
        didMoveToPageNumber: Int
    )
}

class ShortcutsViewManager: NSObject {
    var shortcuts: [Shortcut] = [] {
        didSet {
            let totalNumberOfCells = shortcuts.count + 1
            let itemsPerPage = Int(Constants.numberOfRows + Constants.numberOfColumns)
            let numberOfPages =
            totalNumberOfCells % itemsPerPage == 0 ?
            totalNumberOfCells/itemsPerPage : totalNumberOfCells/itemsPerPage + 1

            delegate?.shortcutsViewManager(self, didCalculateNumberOfPages: numberOfPages)
        }
    }

    weak var delegate: ShortcutsViewManagerDelegate?
}

extension ShortcutsViewManager: ShortcutsViewManagerProtocol {

}

extension ShortcutsViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !shortcuts.isEmpty {
            return shortcuts.count + 1
        } else {
            return 1
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if !shortcuts.isEmpty && indexPath.item != shortcuts.count {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "\(ShortcutCell.self)",
                for: indexPath
            ) as? ShortcutCell else {
                fatalError("failed to deqeue cell")
            }

            let shortcut = shortcuts[indexPath.item]
            cell.configureCell(
                name: shortcut.beverage.name,
                volume: "\(shortcut.volumeConsumed)",
                image: UIImage(named: shortcut.imageName) ?? UIImage(),
                color: UIColor(named: shortcut.colorName) ?? .systemRed
            )
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "\(AddShortcutCell.self)",
                for: indexPath
            ) as? AddShortcutCell else {
                fatalError("failed to deqeue cell")
            }
            return cell
        }
    }
}

extension ShortcutsViewManager: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.shortcutsViewManager(self, didSelectItemAt: indexPath)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ShortcutsViewManager: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // swiftlint:disable line_length
        let availableWidth = collectionView.bounds.width - (Constants.spaceBetweenCards * (Constants.numberOfColumns - 1))
        - (Constants.horizontalCardInsets * 2)
        let width = availableWidth / Constants.numberOfColumns

        let availableHeight = collectionView.bounds.height - (Constants.spaceBetweenCards * (Constants.numberOfRows - 1))
        - (Constants.verticalCardInsets * 2)
        let height = availableHeight / Constants.numberOfRows

        return CGSize(width: width, height: height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.width - Constants.horizontalCardInsets * 2
        let offset = scrollView.contentOffset.x
        let pageNumber = Int((width/2 + offset) / width)
        delegate?.shortcutsViewManager(self, didMoveToPageNumber: pageNumber)
    }

    private enum Constants {
        static let spaceBetweenCards: CGFloat = 10
        static let horizontalCardInsets: CGFloat = 5
        static let verticalCardInsets: CGFloat = 10
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
