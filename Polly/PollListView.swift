//
//  PollListView.swift
//  Polly
//
//  Created by Midhet Sulemani on 13/01/25.
//

import SwiftUI

struct PollListView: View {
    let viewModel: PollListViewModel
    
    var body: some View {
        List(viewModel.polls) {poll in
            VStack(alignment: .leading, spacing: 10) {
                Text(poll.title ?? String())
                    .bold()
                    .font(.headline)
                
                Text(poll.info ?? String())
                
                Text("Voters: \(poll.voterCount)")
                    .font(.caption)
            }
        }
    }
}

#Preview {
    let sampleData = SampleData.createSampleData()
    let displayModel = sampleData.polls.map { PollListDisplayModel(poll: $0, profiles: sampleData.profiles)
    }
    PollListView(viewModel:
                    PollListViewModel(polls: displayModel))
}
