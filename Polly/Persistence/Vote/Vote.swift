//
//  Vote+CoreDataProperties.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//
//

import Foundation
import CoreData

@objc(Vote)
public class Vote: NSManagedObject {

}

extension Vote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vote> {
        return NSFetchRequest<Vote>(entityName: "Vote")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var votedAt: Date?
    @NSManaged public var option: PollOption?
    @NSManaged public var poll: Poll?
    @NSManaged public var voter: Profile?

}

extension Vote: Identifiable {

}

