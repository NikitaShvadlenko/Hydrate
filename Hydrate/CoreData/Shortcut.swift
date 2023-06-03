import Foundation
import CoreData

final class Shortcut: NSManagedObject {

    @NSManaged
    fileprivate(set) var journalEntry: JournalEntry

    @NSManaged
    fileprivate(set) var colorName: String

    @NSManaged
    fileprivate(set) var imageName: String

    static func insert(
        into context: NSManagedObjectContext,
        journalEntry: JournalEntry,
        colorName: String,
        imageName: String
    ) -> Shortcut {
        let shortcut: Shortcut = context.insertObject()
        shortcut.journalEntry = journalEntry
        shortcut.colorName = colorName
        shortcut.imageName = imageName
        return shortcut
    }
}

extension Shortcut: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(journalEntry.date), ascending: false)]
    }
}
