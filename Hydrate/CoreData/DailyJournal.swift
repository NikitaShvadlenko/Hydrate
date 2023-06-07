import CoreData

final class DailyJournal: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var dailyGoal: Double

    static func insert(
        into context: NSManagedObjectContext,
        dailyGoal: Double
    ) -> DailyJournal {
        let dailyJournal: DailyJournal = context.insertObject()
        dailyJournal.dailyGoal = dailyGoal
        dailyJournal.date = Date()
        return dailyJournal
    }
}

extension DailyJournal: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
