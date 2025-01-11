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
    @NSManaged public var votes: NSOrderedSet?

}

// MARK: Generated accessors for votes
extension Profile {

    @objc(insertObject:inVotesAtIndex:)
    @NSManaged public func insertIntoVotes(_ value: Vote, at idx: Int)

    @objc(removeObjectFromVotesAtIndex:)
    @NSManaged public func removeFromVotes(at idx: Int)

    @objc(insertVotes:atIndexes:)
    @NSManaged public func insertIntoVotes(_ values: [Vote], at indexes: NSIndexSet)

    @objc(removeVotesAtIndexes:)
    @NSManaged public func removeFromVotes(at indexes: NSIndexSet)

    @objc(replaceObjectInVotesAtIndex:withObject:)
    @NSManaged public func replaceVotes(at idx: Int, with value: Vote)

    @objc(replaceVotesAtIndexes:withVotes:)
    @NSManaged public func replaceVotes(at indexes: NSIndexSet, with values: [Vote])

    @objc(addVotesObject:)
    @NSManaged public func addToVotes(_ value: Vote)

    @objc(removeVotesObject:)
    @NSManaged public func removeFromVotes(_ value: Vote)

    @objc(addVotes:)
    @NSManaged public func addToVotes(_ values: NSOrderedSet)

    @objc(removeVotes:)
    @NSManaged public func removeFromVotes(_ values: NSOrderedSet)

}

extension Profile: Identifiable {

}
