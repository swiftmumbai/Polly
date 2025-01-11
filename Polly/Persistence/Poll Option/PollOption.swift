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
    @NSManaged public var votes: NSSet?

}

// MARK: Generated accessors for votes
extension PollOption {

    @objc(addVotesObject:)
    @NSManaged public func addToVotes(_ value: Vote)

    @objc(removeVotesObject:)
    @NSManaged public func removeFromVotes(_ value: Vote)

    @objc(addVotes:)
    @NSManaged public func addToVotes(_ values: NSSet)

    @objc(removeVotes:)
    @NSManaged public func removeFromVotes(_ values: NSSet)

}

extension PollOption: Identifiable {

}

