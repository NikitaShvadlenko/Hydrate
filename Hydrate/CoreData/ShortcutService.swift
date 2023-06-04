import CoreData

class ShortcutService {
    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension ShortcutService: DataStorage {
    public func insertItem(_ item: Shortcut) {
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

    public func fetchItems() throws -> [Shortcut] {
        let request = Shortcut.sortedFetchRequest
        request.fetchBatchSize = 20
        let journal = try context.fetch(request)
        return journal
    }
}
