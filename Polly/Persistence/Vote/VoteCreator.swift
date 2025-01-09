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
        poll: Poll,
        voter: Profile,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) -> Vote {
        let vote = Vote(context: context)
        vote.id = UUID()
        vote.votedAt = Date.now
        vote.option = option
        vote.poll = poll
        vote.voter = voter

        // Update relationships using arrays
        var votes: [Vote] = poll.votes.toArray()
        votes.append(vote)
        poll.votes = NSSet(array: votes)

        var voters: [Profile] = poll.voters.toArray()
        voters.append(voter)
        poll.voters = NSSet(array: voters)

        var optionVotes: [Vote] = option.vote.toArray()
        optionVotes.append(vote)
        option.vote = NSSet(array: optionVotes)

        var voterVotes: [Vote] = voter.votes.toArray()
        voterVotes.append(vote)
        voter.votes = NSSet(array: voterVotes)

        var pollsParticipated: [Poll] = voter.pollsParticipated.toArray()
        pollsParticipated.append(poll)
        voter.pollsParticipated = NSSet(array: pollsParticipated)

        do {
            try context.save()
        } catch {
            print("Error saving vote: \(error)")
        }
        return vote
    }

    static public func delete(
        vote: Vote,
        in context: NSManagedObjectContext = PersistenceController.shared.viewContext
    ) {
        // Clean up relationships using arrays
        if let poll = vote.poll, let voter = vote.voter {
            var votes: [Vote] = poll.votes.toArray()
            votes.removeAll { $0 == vote }
            poll.votes = NSSet(array: votes)

            var voters: [Profile] = poll.voters.toArray()
            voters.removeAll { $0 == voter }
            poll.voters = NSSet(array: voters)

            var voterVotes: [Vote] = voter.votes.toArray()
            voterVotes.removeAll { $0 == vote }
            voter.votes = NSSet(array: voterVotes)

            var pollsParticipated: [Poll] = voter.pollsParticipated.toArray()
            pollsParticipated.removeAll { $0 == poll }
            voter.pollsParticipated = NSSet(array: pollsParticipated)
        }

        if let option = vote.option {
            var optionVotes: [Vote] = option.vote.toArray()
            optionVotes.removeAll { $0 == vote }
            option.vote = NSSet(array: optionVotes)
        }

        context.delete(vote)
        do {
            try context.save()
        } catch {
            print("Error deleting vote: \(error)")
        }
    }
}
