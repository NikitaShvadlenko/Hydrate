import CoreData

public final class DailyJournal: NSManagedObject {

    @NSManaged
    public fileprivate(set) var date: Date

    // Can not have daily goal as optional. The default value is 0. 
    @NSManaged
    public fileprivate(set) var dailyGoal: Int

    @NSManaged
    public fileprivate(set) var journalEntries: Set<JournalEntry>

    @objc
    public var totalConsumed: Int {
        journalEntries.reduce(0) { partialResult, entry in
            var result = partialResult
            result += entry.volumeConsumed
            return result
        }
    }

    public static func updateTodaysGoal(context: NSManagedObjectContext, goal: Int) {
        context.performChanges {
            currentDaysJournal(context: context).dailyGoal = goal
        }
    }

    public static func currentDaysJournal(context: NSManagedObjectContext) -> DailyJournal {
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
}

extension DailyJournal: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}

// MARK: - Private Methods
extension DailyJournal {
    // Note - the new journal is created with a goal default value 0
    // (already set in HydrationDataStorage.xcdatamodeld as a default value)
    private static func createNewJournal(context: NSManagedObjectContext) -> DailyJournal {
        let dailyJournal: DailyJournal = context.insertObject()
        dailyJournal.date = Date()
        dailyJournal.dailyGoal = 0
        _ = context.saveOrRollback()
        return dailyJournal
    }
}
