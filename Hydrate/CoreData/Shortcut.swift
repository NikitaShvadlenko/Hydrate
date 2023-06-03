import Foundation
import CoreData

final class Shortcut: NSManagedObject {

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
    ) -> HydrationJournal {
        let hydationJournal: HydrationJournal = context.insertObject()
        hydationJournal.beverage = beverage
        hydationJournal.volumeConsumed = volumeConsumed
        hydationJournal.date = Date()
        return hydationJournal
    }
}

extension HydrationJournal: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
