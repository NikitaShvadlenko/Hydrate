import CoreData

protocol DataServiceProtocol {
    func retrieveJournalEntries() throws -> [JournalEntry]
    func retrieveShortcuts() throws -> [Shortcut]
    func insertJournalEntry(
        beverageName: String,
        volumeConsumed: Double
    )

    func insertShortcut(
        colorName: String,
        imageName: String,
        beverageName: String,
        volumeConsumed: Double
    )

    func createDailyJournalEntry(
        with dailyGoal: Double
    )

    func fetchAllDailyJournals() throws -> [DailyJournal]
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

// MARK: CRUD for each item type
extension CoreDataService: DataServiceProtocol {
    func retrieveShortcuts() throws -> [Shortcut] {
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

extension CoreDataService {
    public func insertJournalEntry(
        beverageName: String,
        volumeConsumed: Double
    ) {
        context.performChanges {
            _ = JournalEntry.insert(
                into: self.context,
                beverage: beverageName,
                volumeConsumed: volumeConsumed
            )
        }
    }

    public func retrieveJournalEntries() throws -> [JournalEntry] {
        let request = JournalEntry.sortedFetchRequest
        request.fetchBatchSize = 20
        let journal = try context.fetch(request)
        return journal
    }
}

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

    public func fetchAllDailyJournals() throws -> [DailyJournal] {
        let request = DailyJournal.sortedFetchRequest
        request.fetchBatchSize = 20
        let journal = try context.fetch(request)
        return journal
    }
}
