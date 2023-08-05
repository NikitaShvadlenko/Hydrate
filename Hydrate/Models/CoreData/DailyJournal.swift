import CoreData

final class DailyJournal: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var dailyGoal: Double

    @NSManaged
    fileprivate(set) var journalEntries: Set<JournalEntry>

    static func insert(
        into context: NSManagedObjectContext,
        dailyGoal: Double
    ) -> DailyJournal {
        let dailyJournal: DailyJournal = context.insertObject()
        dailyJournal.dailyGoal = dailyGoal
        dailyJournal.date = Date()
        return dailyJournal
    }

    static func updateDailyJournal(
        object: DailyJournal,
        into context: NSManagedObjectContext,
        journalEntries: Set<JournalEntry>,
        dailyGoal: Double
    ) {
        guard let updateObject = context.object(with: object.objectID) as? Self else { return }
        updateObject.dailyGoal = dailyGoal
        updateObject.journalEntries = journalEntries
    }
}

extension DailyJournal: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
