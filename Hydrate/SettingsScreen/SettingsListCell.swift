import UIKit

final public class NavigationListCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension NavigationListCell {
    public func configureCell(title: String, onTapAction: () -> Void) {

    }
}

// MARK: - Private methods
extension NavigationListCell {
    private func setupView() {

    }
}

// Depending on the cell type there will be different cells
public enum CellFactory {
    static func createCell(cellType: CellType) -> UICollectionViewCell {
        switch cellType {
        case .personalInformation, .changeGoal, .theme, .connections:
            return NavigationListCell()

        case .yourDrinks, .customDrinks:
            return UICollectionViewCell()

        case .aboutApp:
            return UICollectionViewCell()
        }
    }
}
