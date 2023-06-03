import Foundation
import CoreData

final class Shortcut: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var name: String

    @NSManaged
    fileprivate(set) var colorName: String

    @NSManaged
    fileprivate(set) var volume: Double

    @NSManaged
    fileprivate(set) var imageName: String

    static func insert(
        into context: NSManagedObjectContext,
        name: String,
        volume: Double,
        colorName: String,
        imageName: String
    ) -> Shortcut {
        let shortcut: Shortcut = context.insertObject()
        shortcut.name = name
        shortcut.volume = volume
        shortcut.colorName = colorName
        shortcut.imageName = imageName
        shortcut.date = Date()
        return shortcut
    }
}

extension Shortcut: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
