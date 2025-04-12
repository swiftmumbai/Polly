//
//  PollVM.swift
//  Polly
//
//  Created by Brinda Davda on 05/04/25.
//

import Foundation
import CoreData

final class PollVM: ObservableObject {
    
    private let context: NSManagedObjectContext
    
    @Published var polls: [Poll] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchPolls()
    }
    
    func createPoll(_ poll: PollModel, _ profile: ProfileModel, options: [String]) {
        
        let poll = PollCreator.create(
            title: poll.title,
            info: poll.info,
            isMultipleChoice: poll.isMultipleChoice,
            expiryDate: poll.expiryDate.toDate(),
            in: context
        )
        
        let voter = ProfileCreator.create(name: profile.name, in: context)
        
        for option in options {
            let optionCreate = PollOptionCreator.create(text: option, poll: poll, in: context)
            VoteCreator.create(option: optionCreate, voter: voter, in: context)
        }
        
        try? context.save()
        fetchPolls()
    }
    
    func fetchPolls() {
        polls = PollFetcher.fetchAllPolls(in: context)
        debugPrint("polls: \(polls.count)")
    }
}
