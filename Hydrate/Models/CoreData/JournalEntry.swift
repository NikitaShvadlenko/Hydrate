import Foundation
import CoreData

final class JournalEntry: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var beverage: String

    @NSManaged
    fileprivate(set) var volumeConsumed: Double

    static func insert(
        into context: NSManagedObjectContext,
        beverage: String,
        volumeConsumed: Double
    ) -> JournalEntry {
        let hydationJournal: JournalEntry = context.insertObject()
        hydationJournal.beverage = beverage
        hydationJournal.volumeConsumed = volumeConsumed
        hydationJournal.date = Date()
        return hydationJournal
    }
}

extension JournalEntry: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
