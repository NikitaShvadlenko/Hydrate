import Foundation
import CoreData

public final class JournalEntry: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var beverage: Beverage

    @NSManaged
    fileprivate(set) var dailyJournal: DailyJournal

    @NSManaged
    fileprivate(set) var volumeConsumed: Int

    static func insert(
        into context: NSManagedObjectContext,
        in journal: DailyJournal,
        beverage: Beverage,
        consumed volume: Int
    ) {
        context.performChanges {
            let journalEntry: JournalEntry = context.insertObject()
            journalEntry.dailyJournal = journal
            journalEntry.beverage = beverage
            journalEntry.volumeConsumed = volume
        }
    }
}

extension JournalEntry: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
