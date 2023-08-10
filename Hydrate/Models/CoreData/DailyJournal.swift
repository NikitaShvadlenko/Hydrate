import CoreData

final class DailyJournal: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var dailyGoal: Double

    @NSManaged
    fileprivate(set) var journalEntries: Set<JournalEntry>

    @objc
    var totalConsumed: Double {
        journalEntries.reduce(0) { partialResult, entry in
            var result = partialResult
            result += entry.volumeConsumed
            return result
        }
    }

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
