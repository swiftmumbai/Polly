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
    @NSManaged public var vote: NSSet?
    @NSManaged public var poll: Poll?

}

// MARK: Generated accessors for vote
extension PollOption {

    @objc(addVoteObject:)
    @NSManaged public func addToVote(_ value: Vote)

    @objc(removeVoteObject:)
    @NSManaged public func removeFromVote(_ value: Vote)

    @objc(addVote:)
    @NSManaged public func addToVote(_ values: NSSet)

    @objc(removeVote:)
    @NSManaged public func removeFromVote(_ values: NSSet)

}

extension PollOption: Identifiable {

}

