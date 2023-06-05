import CoreData

protocol DataStorage {

    func retrieveJournalEntries() throws -> [JournalEntry]
    func retrieveShortcuts() throws -> [Shortcut]

    func insertJournalEntry(_ item: JournalEntry)
    func insertShortcut(_ item: Shortcut)
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
extension CoreDataService: DataStorage {
    func retrieveShortcuts() throws -> [Shortcut] {
        let request = Shortcut.sortedFetchRequest
        request.fetchBatchSize = 20
        let shortcuts = try context.fetch(request)
        return shortcuts
    }

    public func insertShortcut(_ item: Shortcut) {
        context.performChanges {
            _ = Shortcut.insert(
                into: self.context,
                colorName: item.colorName,
                imageName: item.imageName,
                beverageName: item.beverageName,
                volumeConsumed: item.volumeConsumed
            )
        }
    }
}

extension CoreDataService {
    public func insertJournalEntry(_ item: JournalEntry) {
        context.performChanges {
            _ = JournalEntry.insert(
                into: self.context,
                beverage: item.beverage,
                volumeConsumed: item.volumeConsumed
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
