struct SettingsViewModel {
    let sections: [SectionViewModel]
}

struct SectionViewModel {
    var sectionType: SectionType
    var sectionTitle: String
    var cells: [CellViewModel]
}

enum SectionType {
    case yourInfo
    case drinks
    case aboutApp
}

struct CellViewModel {
    let cellType: CellType
    let title: String
    let action: () -> Void
}
