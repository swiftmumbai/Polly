//
//  ProfileCreator.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import CoreData
import Foundation

public struct ProfileCreator {

    @discardableResult
    static public func create(
        name: String,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) -> Profile {
        let profile = Profile(context: context)
        profile.id = UUID()
        profile.name = name
        profile.joinedDate = Date.now

        do {
            try context.save()
        } catch {
            Log.error(error)
        }
        return profile
    }

    static public func update(
        profile: Profile,
        name: String? = nil,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        var isEdited = false

        if let name = name, profile.name != name {
            isEdited = true
            profile.name = name
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
        profile: Profile,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        context.delete(profile)
        do {
            try context.save()
        } catch {
            Log.error(error)
        }
    }
}
