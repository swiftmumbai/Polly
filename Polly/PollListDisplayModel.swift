//
//  PollListDisplayModel.swift
//  Polly
//
//  Created by Midhet Sulemani on 13/01/25.
//

import Foundation

struct PollListDisplayModel {
    var id: UUID
    var title: String
    var info: String?
    var createdAt: Date
    var voterCount: Int
    
    init(poll: Poll, profiles: [Profile]) {
        self.id = poll.id ?? UUID()
        self.title = poll.displayTitle
        self.info = poll.info
        self.createdAt = poll.createdAt ?? Date()
        self.voterCount = profiles.filter({ $0.votes?.contains(poll.id ?? UUID()) ?? false }).count
    }
}

extension PollListDisplayModel: Identifiable { }
