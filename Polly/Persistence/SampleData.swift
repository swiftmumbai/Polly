//
//  SampleData.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import Foundation
import CoreData

public enum SampleData {
    
    static let previewContext = PersistenceController(isPreview: true).viewContext
    
    @discardableResult
    static func createSampleData(in context: NSManagedObjectContext = previewContext) -> (profiles: [Profile], polls: [Poll]) {
        // Create sample profiles
        let profile1 = ProfileCreator.create(name: "John Doe", in: context)
        let profile2 = ProfileCreator.create(name: "Jane Smith", in: context)
        let profile3 = ProfileCreator.create(name: "Bob Wilson", in: context)
        
        // Create sample polls
        let poll1 = PollCreator.create(
            title: "Favorite Programming Language",
            info: "What's your preferred programming language?",
            isMultipleChoice: false,
            expiryDate: Date.now.addingTimeInterval(7 * 24 * 3600), // 7 days from now
            in: context
        )
        
        // Add options to poll1
        let poll1Options = [
            PollOptionCreator.create(text: "Swift", poll: poll1, in: context),
            PollOptionCreator.create(text: "Python", poll: poll1, in: context),
            PollOptionCreator.create(text: "JavaScript", poll: poll1, in: context),
            PollOptionCreator.create(text: "Java", poll: poll1, in: context)
        ]
        
        let poll2 = PollCreator.create(
            title: "Favorite iOS Framework",
            info: "Which Apple framework do you use the most?",
            isMultipleChoice: true,
            expiryDate: Date.now.addingTimeInterval(5 * 24 * 3600), // 5 days from now
            in: context
        )
        
        // Add options to poll2
        let poll2Options = [
            PollOptionCreator.create(text: "SwiftUI", poll: poll2, in: context),
            PollOptionCreator.create(text: "UIKit", poll: poll2, in: context),
            PollOptionCreator.create(text: "Core Data", poll: poll2, in: context),
            PollOptionCreator.create(text: "Combine", poll: poll2, in: context)
        ]
        
        // Create some votes
        VoteCreator.create(option: poll1Options[0], poll: poll1, voter: profile1, in: context)
        VoteCreator.create(option: poll1Options[1], poll: poll1, voter: profile2, in: context)
        VoteCreator.create(option: poll1Options[0], poll: poll1, voter: profile3, in: context)
        
        VoteCreator.create(option: poll2Options[0], poll: poll2, voter: profile1, in: context)
        VoteCreator.create(option: poll2Options[1], poll: poll2, voter: profile2, in: context)
        VoteCreator.create(option: poll2Options[2], poll: poll2, voter: profile2, in: context)
        
        return (
            profiles: [profile1, profile2, profile3],
            polls: [poll1, poll2]
        )
    }
    
    static var previewProfile: Profile {
        let profile = ProfileCreator.create(name: "Preview User", in: previewContext)
        try? previewContext.save()
        return profile
    }
    
    static var previewPoll: Poll {
        let poll = PollCreator.create(
            title: "Preview Poll",
            info: "This is a preview poll",
            isMultipleChoice: false,
            expiryDate: Date.now.addingTimeInterval(24 * 3600),
            in: previewContext
        )
        
        let option1 = PollOptionCreator.create(text: "Option 1", poll: poll, in: previewContext)
        
        let voter = previewProfile
        VoteCreator.create(option: option1, poll: poll, voter: voter, in: previewContext)
        
        try? previewContext.save()
        return poll
    }

}

