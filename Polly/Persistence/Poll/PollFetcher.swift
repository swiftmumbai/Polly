//
//  PollFetcher.swift
//  Polly
//
//  Created by Brinda Davda on 29/03/25.
//

import CoreData
import Foundation

public struct PollFetcher{
    
    static public func fetchAllPolls(in context: NSManagedObjectContext = PersistenceController.shared.viewContext) -> [Poll] {
        let request: NSFetchRequest<Poll> = Poll.fetchRequest()
        do {
            print("Fetched Sucessfully...")
            return try context.fetch(request)
        } catch {
            fatalError("Failed to fetch polls: \(error)")
        }
    }
}
