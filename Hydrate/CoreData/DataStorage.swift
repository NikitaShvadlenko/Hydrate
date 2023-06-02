import CoreData

protocol DataStorage {
    associatedtype Item: Managed
     func fetchItems() throws -> [Item]
     func insertItem(_ item: Item)
}

class HydrationDataService {
    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension HydrationDataService: DataStorage {
    public func insertItem(_ item: HydrationJournal) {
        context.performChanges {
            _ = HydrationJournal.insert(
                into: self.context,
                beverage: item.beverage,
                volumeConsumed: item.volumeConsumed
            )
        }
    }

    public func fetchItems() throws -> [HydrationJournal] {
        let request = HydrationJournal.sortedFetchRequest
        request.fetchBatchSize = 20
        let journal = try context.fetch(request)
        return journal
    }
}
