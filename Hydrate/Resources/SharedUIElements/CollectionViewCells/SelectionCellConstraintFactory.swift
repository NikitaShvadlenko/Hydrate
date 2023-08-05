import Foundation

enum SelectionCellConstraintFactory {
    static func strategy(for style: SelectionCollectionViewCell.Style) -> SelectionCellConstraintStrategy {
        switch style {
        case .horizontal:
            return HorizontalCellConstraintStrategy()

        case .vertical:
            return VerticalCellConstraintStrategy()
        }
    }
}
