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
        var optionVotes = option.votes?.mutableCopy() as? NSMutableOrderedSet ?? NSMutableOrderedSet()
        optionVotes.add(vote)
        option.votes = optionVotes

        var voterVotes = voter.votes?.mutableCopy() as? NSMutableOrderedSet ?? NSMutableOrderedSet()
        voterVotes.add(vote)
        voter.votes = voterVotes

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
            let optionVotes = option.votes?.mutableCopy() as? NSMutableOrderedSet ?? NSMutableOrderedSet()
            optionVotes.remove(vote)
            option.votes = optionVotes
        }

        if let profile = vote.profile {
            let profileVotes = profile.votes?.mutableCopy() as? NSMutableOrderedSet ?? NSMutableOrderedSet()
            profileVotes.remove(vote)
            profile.votes = profileVotes
        }

        context.delete(vote)
        do {
            try context.save()
        } catch {
            Log.error(error)
        }
    }
}
