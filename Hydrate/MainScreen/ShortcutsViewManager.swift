import UIKit
protocol ShortcutsViewManagerProtocol {
    var shortcuts: [Shortcut]? { get set }
}

class ShortcutsViewManager: NSObject {
    var shortcuts: [Shortcut]?
}

extension ShortcutsViewManager: ShortcutsViewManagerProtocol {

}

extension ShortcutsViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let shortcuts = shortcuts else {
            fatalError("shortcuts array was not set")
        }
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
        guard let shortcuts = shortcuts else {
            fatalError("shortcuts array was not set")
        }
        if !shortcuts.isEmpty && indexPath.item != shortcuts.count + 1 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "\(ShortcutCell.self)",
                for: indexPath
            ) as? ShortcutCell else {
                fatalError("failed to deqeue cell")
            }
            // TODO: handle nil values for image and color
            let shortcut = shortcuts[indexPath.item]
            cell.configureCell(
                name: shortcut.name,
                volume: "\(shortcut.volume)",
                image: UIImage(named: shortcut.imageName) ?? UIImage(),
                color: UIColor(named: shortcut.colorName) ?? .black
            )
        } else {

        }
    }
}
