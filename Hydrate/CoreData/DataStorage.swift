import CoreData

protocol DataStorage {
    associatedtype Item: Managed
     func fetchItems() throws -> [Item]
     func insertItem(_ item: Item)
}

