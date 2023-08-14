import UIKit

 enum CellFactory {
     static func createCell(cellType: CellType) -> UICollectionViewCell {
        switch cellType {
        case .personalInformation, .changeGoal, .theme, .connections:
            return NavigationListCell()

        case .yourDrinks, .customDrinks:
            return NavigationListCell()

        case .aboutApp:
            return NavigationListCell()
        }
    }
}
