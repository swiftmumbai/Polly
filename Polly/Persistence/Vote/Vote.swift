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
    @NSManaged public var options: PollOption?
    @NSManaged public var profile: Profile?

}

extension Vote: Identifiable {

}

