//
//  PollListViewModel.swift
//  Polly
//
//  Created by Midhet Sulemani on 13/01/25.
//

import Foundation

final class PollListViewModel: ObservableObject {
    @Published var polls: [PollListDisplayModel]
    
    init(polls: [PollListDisplayModel]) {
        self.polls = polls
    }
}
