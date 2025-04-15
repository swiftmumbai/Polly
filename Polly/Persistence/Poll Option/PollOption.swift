//
//  PollOption+CoreDataProperties.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//
//

import Foundation
import CoreData

@objc(PollOption)
public class PollOption: NSManagedObject {

}

extension PollOption {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PollOption> {
        return NSFetchRequest<PollOption>(entityName: "PollOption")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var image: Data?
    @NSManaged public var poll: Poll?
    @NSManaged public var votes: NSOrderedSet?

}

// MARK: Generated accessors for votes
extension PollOption {

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

extension PollOption: Identifiable {

}
