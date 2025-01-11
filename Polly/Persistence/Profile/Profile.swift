//
//  Profile+CoreDataProperties.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//
//

import Foundation
import CoreData

@objc(Profile)
public class Profile: NSManagedObject {

}

extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var joinedDate: Date?
    @NSManaged public var votes: NSSet?

}

// MARK: Generated accessors for votes
extension Profile {

    @objc(addVotesObject:)
    @NSManaged public func addToVotes(_ value: Vote)

    @objc(removeVotesObject:)
    @NSManaged public func removeFromVotes(_ value: Vote)

    @objc(addVotes:)
    @NSManaged public func addToVotes(_ values: NSSet)

    @objc(removeVotes:)
    @NSManaged public func removeFromVotes(_ values: NSSet)

}

extension Profile: Identifiable {

}
