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
}

class ShortcutsViewManager: NSObject {
    var shortcuts: [Shortcut] = [] {
        didSet {
            let totalNumberOfCells = shortcuts.count
        }
    }

    weak var delegate: ShortcutsViewManagerDelegate?
}

extension ShortcutsViewManager: ShortcutsViewManagerProtocol {

}

extension ShortcutsViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shortcuts.count + 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
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
