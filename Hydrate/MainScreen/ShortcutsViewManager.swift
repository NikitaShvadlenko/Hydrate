import UIKit
protocol ShortcutsViewManagerProtocol {
    var shortcuts: [Int] { get set }
}

class ShortcutsViewManager: NSObject {
    var shortcuts: [Int] = [2,3,4,5,5]
}

extension ShortcutsViewManager: ShortcutsViewManagerProtocol {

}

extension ShortcutsViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shortcuts.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ShortcutCell.self)", for: indexPath) as? ShortcutCell else {
            fatalError("Failed to deque cell")
        }
        cell.configureCell(name: "Water", volume: "12oz", image: Asset.screenshot20230520At003206.image , color: .systemBlue)

        return cell
    }
}
