import UIKit

class SettingsListCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension SettingsListCell {
    public func configureCell(cellType: CellType) {

    }
}

// MARK: - Private methods
extension SettingsListCell {
    private func setupView() {

    }
}

// Depending on the cell type there will be different cells

enum CellType {
    case personalInformation
    case changeGoal
    case theme
    case connections

    case yourDrinks
    case customDrinks

    case aboutApp

}

struct Section {
    var sectionType: SectionType
    var cells: [Cell]
}

enum SectionType {
    case yourInfo
    case drinks
    case aboutApp
}

struct Cell {
    var cellType: CellType
}

struct ListViewModel {
    var sections: [Section]
}

let myViewModel = ListViewModel(
    sections: [
        Section(
            sectionType: .yourInfo,
            cells: [
                Cell(cellType: .personalInformation),
                Cell(cellType: .changeGoal),
                Cell(cellType: .theme),
                Cell(cellType: .connections)
            ]
        ),
        Section(
            sectionType: .drinks,
            cells: [
                Cell(cellType: .yourDrinks),
                Cell(cellType: .customDrinks)
            ]
        ),
        Section(
            sectionType: .aboutApp,
            cells: [
                Cell(cellType: .aboutApp)
            ]
        )
    ]
)

public enum CellFactory {
    static func createCell(cellType: CellType) -> UICollectionViewCell {
        switch cellType {
        case .personalInformation, .changeGoal, .theme, .connections:
            return UICollectionViewCell()

        case .yourDrinks, .customDrinks:
            return UICollectionViewCell()

        case .aboutApp:
            return UICollectionViewCell()
        }
    }
}
