import Foundation
import CoreData

final class Shortcut: NSManagedObject {

    @NSManaged
    fileprivate(set) var colorName: String

    @NSManaged
    fileprivate(set) var imageName: String

    @NSManaged
    fileprivate(set) var beverage: Beverage

    @NSManaged
    fileprivate(set) var volumeConsumed: Int

    @NSManaged
    fileprivate(set) var date: Date

    static func insert(
        into context: NSManagedObjectContext,
        colorName: String,
        imageName: String,
        beverage: Beverage,
        volumeConsumed: Int
    ) {
        context.performChanges {
            let shortcut: Shortcut = context.insertObject()
            shortcut.colorName = colorName
            shortcut.imageName = imageName
            shortcut.volumeConsumed = volumeConsumed
            shortcut.beverage = beverage
            shortcut.date = Date()
        }
    }
}

extension Shortcut: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
