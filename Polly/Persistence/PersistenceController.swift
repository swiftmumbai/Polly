//
//  PersistenceController.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import Foundation
import CoreData

public final class PersistenceController {

    let container: NSPersistentContainer
    public let viewContext: NSManagedObjectContext

    private let modelName = "PollyModel"

    nonisolated(unsafe) public static let shared = PersistenceController()

    init(isPreview: Bool = false) {
        container = NSPersistentContainer(name: modelName)

        if isPreview {
            let description = NSPersistentStoreDescription(url: URL(filePath: "/dev/null"))
            description.type = NSInMemoryStoreType
            container.persistentStoreDescriptions = [description]
        } else {
            let storeURL = URL.storeURL(databaseName: modelName)
            let storeDescription = NSPersistentStoreDescription(url: storeURL)
            container.persistentStoreDescriptions = [storeDescription]
        }

        container.loadPersistentStores { description, error in
            if let storeURL = description.url?.path() {
                Log.info("Database loaded at: \(storeURL)")
            }
            if let error = error {
                assertionFailure("Failed to load CoreDataStack with error: \(error.localizedDescription)")
            }
        }

        self.viewContext = container.viewContext
        self.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        self.viewContext.automaticallyMergesChangesFromParent = true
    }

    public func newBackgroundContext() -> NSManagedObjectContext {
        let context = container.newBackgroundContext()
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        return context
    }

    public func fetchAllObjects<T: NSManagedObject>(
        _ type: T.Type,
        sortBy sortDescriptors: [NSSortDescriptor]? = nil,
        predicate: NSPredicate? = nil,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) -> [T] {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        guard let typedFetchRequest = fetchRequest as? NSFetchRequest<T> else {
            Log.error(NSError(
                domain: "CoreDataHelper",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid fetch request for type \(T.self)"]
            ))
            return []
        }
        typedFetchRequest.sortDescriptors = sortDescriptors
        typedFetchRequest.predicate = predicate
        do {
            let results = try context.fetch(typedFetchRequest)
            return results
        } catch {
            Log.error(error)
            return []
        }
    }

    public func fetchSingle<T: NSManagedObject>(
        _ entityClass: T.Type,
        sortBy sortDescriptors: [NSSortDescriptor]? = nil,
        predicate: NSPredicate? = nil,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) -> T? {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        guard let typedFetchRequest = fetchRequest as? NSFetchRequest<T> else {
            Log.error(NSError(
                domain: "CoreDataHelper",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid fetch request for type \(T.self)"]
            ))
            return nil
        }

        typedFetchRequest.sortDescriptors = sortDescriptors
        typedFetchRequest.predicate = predicate
        typedFetchRequest.fetchLimit = 1

        do {
            let items = try context.fetch(typedFetchRequest)
            return items.first
        } catch {
            Log.error(error)
            return nil
        }
    }

    public func deleteAllObjects<T: NSManagedObject>(
        _ type: T.Type,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            Log.info("Successfully deleted all objects of type \(String(describing: T.self))")
        } catch {
            Log.error(error)
        }
    }
}
