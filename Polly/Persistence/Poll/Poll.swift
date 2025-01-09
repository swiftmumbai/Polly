//
//  Poll+CoreDataProperties.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//
//

import Foundation
import CoreData

@objc(Poll)
public class Poll: NSManagedObject {

}

extension Poll {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Poll> {
        return NSFetchRequest<Poll>(entityName: "Poll")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var info: String?
    @NSManaged public var isMultipleChoice: Bool
    @NSManaged public var expiryDate: Date?
    @NSManaged public var createdAt: Date?
    @NSManaged public var isActive: Bool
    @NSManaged public var votes: NSSet?
    @NSManaged public var options: NSSet?
    @NSManaged public var voters: NSSet?

}

// MARK: Generated accessors for votes
extension Poll {

    @objc(addVotesObject:)
    @NSManaged public func addToVotes(_ value: Vote)

    @objc(removeVotesObject:)
    @NSManaged public func removeFromVotes(_ value: Vote)

    @objc(addVotes:)
    @NSManaged public func addToVotes(_ values: NSSet)

    @objc(removeVotes:)
    @NSManaged public func removeFromVotes(_ values: NSSet)

}

// MARK: Generated accessors for options
extension Poll {

    @objc(addOptionsObject:)
    @NSManaged public func addToOptions(_ value: PollOption)

    @objc(removeOptionsObject:)
    @NSManaged public func removeFromOptions(_ value: PollOption)

    @objc(addOptions:)
    @NSManaged public func addToOptions(_ values: NSSet)

    @objc(removeOptions:)
    @NSManaged public func removeFromOptions(_ values: NSSet)

}

// MARK: Generated accessors for voters
extension Poll {

    @objc(addVotersObject:)
    @NSManaged public func addToVoters(_ value: Profile)

    @objc(removeVotersObject:)
    @NSManaged public func removeFromVoters(_ value: Profile)

    @objc(addVoters:)
    @NSManaged public func addToVoters(_ values: NSSet)

    @objc(removeVoters:)
    @NSManaged public func removeFromVoters(_ values: NSSet)

}

extension Poll: Identifiable {

}
