import Foundation

struct SettingsViewModel {
    let sections: [SectionViewModel]
}

struct SectionViewModel: Hashable {
    var sectionType: SectionType
    var sectionTitle: String
    var cells: [CellViewModel]
    var identifier = UUID()

    static func == (lhs: SectionViewModel, rhs: SectionViewModel) -> Bool {
        lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

enum SectionType {
    case yourInfo
    case drinks
    case aboutApp
}

struct CellViewModel: Hashable {
    let identifier = UUID()
    let cellType: CellType
    let title: String
    let action: () -> Void

    static func == (lhs: CellViewModel, rhs: CellViewModel) -> Bool {
        lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
