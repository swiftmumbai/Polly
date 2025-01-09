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

        do {
            try context.save()
        } catch {
            print("Error saving poll option: \(error)")
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
            print("Error updating poll option: \(error)")
        }
    }

    static public func delete(
        option: PollOption,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        context.delete(option)
        do {
            try context.save()
        } catch {
            print("Error deleting poll option: \(error)")
        }
    }
}
