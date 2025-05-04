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
    @NSManaged public var options: NSOrderedSet?

}

// MARK: Generated accessors for options
extension Poll {

    @objc(insertObject:inOptionsAtIndex:)
    @NSManaged public func insertIntoOptions(_ value: PollOption, at idx: Int)

    @objc(removeObjectFromOptionsAtIndex:)
    @NSManaged public func removeFromOptions(at idx: Int)

    @objc(insertOptions:atIndexes:)
    @NSManaged public func insertIntoOptions(_ values: [PollOption], at indexes: NSIndexSet)

    @objc(removeOptionsAtIndexes:)
    @NSManaged public func removeFromOptions(at indexes: NSIndexSet)

    @objc(replaceObjectInOptionsAtIndex:withObject:)
    @NSManaged public func replaceOptions(at idx: Int, with value: PollOption)

    @objc(replaceOptionsAtIndexes:withOptions:)
    @NSManaged public func replaceOptions(at indexes: NSIndexSet, with values: [PollOption])

    @objc(addOptionsObject:)
    @NSManaged public func addToOptions(_ value: PollOption)

    @objc(removeOptionsObject:)
    @NSManaged public func removeFromOptions(_ value: PollOption)

    @objc(addOptions:)
    @NSManaged public func addToOptions(_ values: NSOrderedSet)

    @objc(removeOptions:)
    @NSManaged public func removeFromOptions(_ values: NSOrderedSet)

}

extension Poll: Identifiable {

}

extension Poll {
    var displayTitle: String {
        title ?? "Untitled Poll"
    }
}
