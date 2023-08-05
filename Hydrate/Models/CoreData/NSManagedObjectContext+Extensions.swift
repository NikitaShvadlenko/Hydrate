import Foundation
import CoreData

extension NSManagedObjectContext {
    func insertObject<T: NSManagedObject>() -> T where T: Managed {
        guard let object = NSEntityDescription.insertNewObject(
                forEntityName: T.entityName,
                into: self
            ) as? T else {
            fatalError("Wrong object type")
        }
        return object
    }
}

extension NSManagedObjectContext {
    public func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }

    public func performChanges(block: @escaping() -> Void) {
        perform {
            block()
            _ = self.saveOrRollback()
        }
    }
}
