//
//  PollCreator.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import CoreData
import Foundation

public struct PollCreator {

    @discardableResult
    static public func create(
        title: String,
        info: String? = nil,
        isMultipleChoice: Bool = false,
        expiryDate: Date? = nil,
        isActive: Bool = true,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) -> Poll {
        let poll = Poll(context: context)
        poll.id = UUID()
        poll.title = title
        poll.info = info
        poll.isMultipleChoice = isMultipleChoice
        poll.expiryDate = expiryDate
        poll.createdAt = Date.now
        poll.isActive = isActive

        do {
            try context.save()
        } catch {
            Log.error(error)
        }
        return poll
    }

    static public func update(
        poll: Poll,
        title: String? = nil,
        info: String? = nil,
        isMultipleChoice: Bool? = nil,
        expiryDate: Date? = nil,
        isActive: Bool? = nil,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        var isEdited = false

        if let title = title, poll.title != title {
            isEdited = true
            poll.title = title
        }
        if let info = info, poll.info != info {
            isEdited = true
            poll.info = info
        }
        if let isMultipleChoice = isMultipleChoice, poll.isMultipleChoice != isMultipleChoice {
            isEdited = true
            poll.isMultipleChoice = isMultipleChoice
        }
        if let expiryDate = expiryDate, poll.expiryDate != expiryDate {
            isEdited = true
            poll.expiryDate = expiryDate
        }
        if let isActive = isActive, poll.isActive != isActive {
            isEdited = true
            poll.isActive = isActive
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
        poll: Poll,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        context.delete(poll)
        do {
            try context.save()
        } catch {
            Log.error(error)
        }
    }
}
