//
//  PollOptionCreator.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import CoreData
import Foundation

public struct PollOptionCreator {

    @discardableResult
    static public func create(
        text: String,
        image: Data? = nil,
        poll: Poll,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) -> PollOption {
        let option = PollOption(context: context)
        option.id = UUID()
        option.text = text
        option.image = image
        option.poll = poll

        // Update poll's options relationship
        var pollOptions: [PollOption] = poll.options?.toArray() ?? []
        pollOptions.append(option)
        poll.options = NSSet(array: pollOptions)

        do {
            try context.save()
        } catch {
            Log.error(error)
        }
        return option
    }

    static public func update(
        option: PollOption,
        text: String? = nil,
        image: Data? = nil,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        var isEdited = false

        if let text = text, option.text != text {
            isEdited = true
            option.text = text
        }
        if let image = image, option.image != image {
            isEdited = true
            option.image = image
        }

        do {
            if isEdited {
                try context.save()
            }
        } catch {
            Log.error(error)
        }
    }

    static public func delete(
        option: PollOption,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        // Clean up relationships
        if let poll = option.poll {
            var pollOptions: [PollOption] = poll.options?.toArray() ?? []
            pollOptions.removeAll { $0 == option }
            poll.options = NSSet(array: pollOptions)
        }

        // Delete associated votes
        if let votes = option.votes {
            let voteArray = votes.toArray() as [Vote]
            voteArray.forEach { context.delete($0) }
        }

        context.delete(option)
        do {
            try context.save()
        } catch {
            Log.error(error)
        }
    }
}
