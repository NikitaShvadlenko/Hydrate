import Foundation
import CoreData

final class HydrationJournal: NSManagedObject {

    @NSManaged
    fileprivate(set) var volume: Double

    @NSManaged
    fileprivate(set) var colorName: String

    @NSManaged
    fileprivate(set) var imageName: String

    @NSManaged
    fileprivate(set) var name: String

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
