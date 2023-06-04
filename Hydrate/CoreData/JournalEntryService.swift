import CoreData

class JournalEntryService {
    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension JournalEntryService: DataStorage {
    public func insertItem(_ item: JournalEntry) {
        context.performChanges {
            _ = JournalEntry.insert(
                into: self.context,
                beverage: item.beverage,
                volumeConsumed: item.volumeConsumed
            )
        }
    }

    public func fetchItems() throws -> [JournalEntry] {
        let request = JournalEntry.sortedFetchRequest
        request.fetchBatchSize = 20
        let journal = try context.fetch(request)
        return journal
    }
}
