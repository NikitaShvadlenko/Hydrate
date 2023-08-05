import CoreData

// TODO: Refactor
protocol DataServiceProtocol {
    func retrieveAllJournalEntries() throws -> [JournalEntry]
    func retrieveAllShortcuts() throws -> [Shortcut]
    func insertJournalEntry(
        beverageName: String,
        volumeConsumed: Double
    ) -> JournalEntry

    func insertShortcut(
        colorName: String,
        imageName: String,
        beverageName: String,
        volumeConsumed: Double
    )

    func createDailyJournalEntry(
        with dailyGoal: Double
    )

    func fetchAllDailyJournals(datePredicate: NSPredicate) throws -> [DailyJournal]

    func addJournalEntry(
        to object: DailyJournal,
        journalEntry: JournalEntry
    )

    func changeDailyGoal(
        of object: DailyJournal,
        in context: NSManagedObjectContext,
        newGoal: Double
    )

    func retrieveUserData() throws -> UserData?
}

class CoreDataService {
    var context: NSManagedObjectContext
    var container: NSPersistentContainer

    static let shared = CoreDataService()

    private init() {
        self.container = NSPersistentContainer(name: Constants.hydrationJournalContainerName.rawValue)
        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Failed to load store: \(String(describing: error))")
            }
        }
        self.context = container.viewContext
    }

    enum Constants: String {
        case hydrationJournalContainerName = "HydrationDataStorage"
    }

}

// MARK: Shortcuts
extension CoreDataService: DataServiceProtocol {
    func retrieveAllShortcuts() throws -> [Shortcut] {
        let request = Shortcut.sortedFetchRequest
        request.fetchBatchSize = 20
        let shortcuts = try context.fetch(request)
        return shortcuts
    }

    public func insertShortcut(
        colorName: String,
        imageName: String,
        beverageName: String,
        volumeConsumed: Double
    ) {
        context.performChanges {
            _ = Shortcut.insert(
                into: self.context,
                colorName: colorName,
                imageName: imageName,
                beverageName: beverageName,
                volumeConsumed: volumeConsumed
            )
        }
    }
}

// MARK: Journal Entry
extension CoreDataService {
    public func insertJournalEntry(
        beverageName: String,
        volumeConsumed: Double
    ) -> JournalEntry {
        var createdJournalEntry = JournalEntry.insert(
            into: self.context,
            beverage: beverageName,
            volumeConsumed: volumeConsumed
        )

        context.performChanges {
            _ = createdJournalEntry
        }
        return createdJournalEntry
    }

    public func retrieveAllJournalEntries() throws -> [JournalEntry] {
        let request = JournalEntry.sortedFetchRequest
        request.fetchBatchSize = 20
        let journal = try context.fetch(request)
        return journal
    }
}

// MARK: Daily Journal
extension CoreDataService {
    public func createDailyJournalEntry(
        with dailyGoal: Double
    ) {
        context.performChanges {
            _ = DailyJournal.insert(
                into: self.context,
                dailyGoal: dailyGoal
            )
        }
    }

    public func fetchAllDailyJournals(datePredicate: NSPredicate) throws -> [DailyJournal] {
        let request = DailyJournal.sortedFetchRequest
        request.predicate = datePredicate
        request.fetchBatchSize = 1
        let journal = try context.fetch(request)
        return journal
    }

    public func addJournalEntry(
        to object: DailyJournal,
        journalEntry: JournalEntry
    ) {
        var entries = object.journalEntries
        entries.insert(journalEntry)
        let goal = object.dailyGoal
        context.performChanges {
            DailyJournal.updateDailyJournal(
                object: object,
                into: self.context,
                journalEntries: entries,
                dailyGoal: goal
            )
        }
    }

    public func changeDailyGoal(
        of object: DailyJournal,
        in context: NSManagedObjectContext,
        newGoal: Double
    ) {
        let journalEntries = object.journalEntries
        context.performChanges {
            DailyJournal.updateDailyJournal(
                object: object,
                into: context,
                journalEntries: journalEntries,
                dailyGoal: newGoal
            )
        }
    }
}

extension CoreDataService {
    func retrieveUserData() throws -> UserData? {
        let request = UserData.sortedFetchRequest
        request.fetchBatchSize = 1
        let user = try context.fetch(request)
        return user.first
    }
}
