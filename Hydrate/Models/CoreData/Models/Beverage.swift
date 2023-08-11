import CoreData
import UIKit.UIImage
import UIKit.UIColor

final class Beverage: NSManagedObject {

    @NSManaged
    fileprivate(set) var dateAdded: Date

    @NSManaged
    fileprivate(set) var associatedColor: UIColor?

    @NSManaged
    fileprivate(set) var image: UIImage?

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
