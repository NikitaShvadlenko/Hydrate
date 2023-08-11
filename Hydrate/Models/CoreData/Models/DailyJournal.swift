import CoreData

final class DailyJournal: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var dailyGoal: Int

    @NSManaged
    fileprivate(set) var journalEntries: Set<JournalEntry>

    @objc
    var totalConsumed: Int {
        journalEntries.reduce(0) { partialResult, entry in
            var result = partialResult
            result += entry.volumeConsumed
            return result
        }
    }

    static func currentDaysJournal(context: NSManagedObjectContext) -> DailyJournal {
        let fetchRequest = sortedFetchRequest
        do {
            let journalEntries = try context.fetch(fetchRequest)
            guard let lastJournal = journalEntries.first else {
                return createNewJournal(context: context)
            }
            if Calendar(identifier: .gregorian).isDateInToday(lastJournal.date) {
                return lastJournal
            } else {
                return createNewJournal(context: context)
            }
        } catch {
            fatalError("Failed to execute fetch request: \(error)")
        }
    }

    private static func createNewJournal(context: NSManagedObjectContext) -> DailyJournal {
        let dailyJournal: DailyJournal = context.insertObject()
        dailyJournal.dailyGoal = 3000
        dailyJournal.date = Date()
        _ = context.saveOrRollback()
        return dailyJournal
    }

//    static func insert(
//        into context: NSManagedObjectContext,
//        dailyGoal: Int
//    ) -> DailyJournal {
//        context.performC
//        let dailyJournal: DailyJournal = context.insertObject()
//        dailyJournal.dailyGoal = dailyGoal
//        dailyJournal.date = Date()
//        return dailyJournal
//    }

//    static func updateDailyJournal(
//        object: DailyJournal,
//        into context: NSManagedObjectContext,
//        journalEntries: Set<JournalEntry>,
//        dailyGoal: Int
//    ) {
//        guard let updateObject = context.object(with: object.objectID) as? Self else { return }
//        updateObject.dailyGoal = dailyGoal
//        updateObject.journalEntries = journalEntries
//    }
}

extension DailyJournal: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
