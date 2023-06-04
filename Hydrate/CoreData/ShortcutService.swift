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
                journalEntry: item.journalEntry,
                colorName: item.colorName,
                imageName: item.imageName
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
