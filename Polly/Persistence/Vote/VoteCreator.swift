//
//  VoteCreator.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import CoreData
import Foundation

public struct VoteCreator {

    @discardableResult
    static public func create(
        option: PollOption,
        voter: Profile,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) -> Vote {
        let vote = Vote(context: context)
        vote.id = UUID()
        vote.votedAt = Date.now
        vote.options = option
        vote.profile = voter

        // Update relationships
        var optionVotes: [Vote] = option.votes?.toArray() ?? []
        optionVotes.append(vote)
        option.votes = NSSet(array: optionVotes)

        var voterVotes: [Vote] = voter.votes?.toArray() ?? []
        voterVotes.append(vote)
        voter.votes = NSSet(array: voterVotes)

        do {
            try context.save()
        } catch {
            Log.error(error)
        }
        return vote
    }

    static public func delete(
        vote: Vote,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        // Clean up relationships
        if let option = vote.options {
            var optionVotes: [Vote] = option.votes?.toArray() ?? []
            optionVotes.removeAll { $0 == vote }
            option.votes = NSSet(array: optionVotes)
        }

        if let profile = vote.profile {
            var profileVotes: [Vote] = profile.votes?.toArray() ?? []
            profileVotes.removeAll { $0 == vote }
            profile.votes = NSSet(array: profileVotes)
        }

        context.delete(vote)
        do {
            try context.save()
        } catch {
            Log.error(error)
        }
    }
}
