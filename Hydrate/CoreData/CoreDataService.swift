import CoreData

func createHydrationJournalContainer(
    completion: @escaping(NSPersistentContainer) -> Void
) {
    let container = NSPersistentContainer(name: Constants.hydrationJournalContainerName.rawValue)
    container.loadPersistentStores { _, error in
        guard error == nil else {
            fatalError("Failed to load store: \(String(describing: error))")
        }
        DispatchQueue.main.async {
            completion(container)
        }
    }
}

enum Constants: String {
    case hydrationJournalContainerName = "HydrationDataStorage"
}
