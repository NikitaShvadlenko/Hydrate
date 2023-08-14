import CoreData

final class Beverage: NSManagedObject {

    @NSManaged
    fileprivate(set) var dateAdded: Date

    @NSManaged
    fileprivate(set) var associatedColor: String?

    @NSManaged
    fileprivate(set) var name: String

    @NSManaged
    fileprivate(set) var identificator: UUID

    @NSManaged
    fileprivate(set) var ratio: Double

    @NSManaged
    fileprivate(set) var journalEntries: Set<JournalEntry>

    @NSManaged
    fileprivate(set) var shortcuts: Set<Shortcut>

    @NSManaged
    fileprivate(set) var beverageIconRawValue: String

//    static func insert(
//        into context: NSManagedObjectContext,
//        beverage: String,
//        volumeConsumed: Double
//    ) -> Beverage {
//        let hydationJournal: JournalEntry = context.insertObject()
//        hydationJournal.beverage = beverage
//        hydationJournal.volumeConsumed = volumeConsumed
//        hydationJournal.date = Date()
//        return hydationJournal
//    }
}

extension Beverage: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(dateAdded), ascending: false)]
    }
}

extension Beverage {
    var beverageIcon: BeverageIcon {
        get {
            guard let activityLevel = BeverageIcon(rawValue: beverageIconRawValue) else {
                fatalError("Failed to convert")
            }
            return activityLevel
        }
        set {
            beverageIconRawValue = newValue.rawValue
        }
    }
}

