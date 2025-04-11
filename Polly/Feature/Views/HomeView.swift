//
//  HomeView.swift
//  Polly
//
//  Created by Brinda Davda on 05/04/25.
//

import SwiftUI

struct HomeView : View { @ObserveInjection private var inject
    
    @State var polls: [Poll] = PollVM.fetchAllPolls
    
    var body: some View {
        VStack(alignment: .leading) {
            if polls.isEmpty {
                Button {
                    print("Sample Data created..")
                    PollVM.createPoll()
                    polls = PollVM.fetchAllPolls
                }
                label:{
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            } else {
                ScrollView {
                    ForEach(polls.indices, id: \.self) { index in
                        Text(polls[index].title ?? "")
                            .font(.largeTitle)
                    }
                }
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if !polls.isEmpty {
                    Button {
                        print("Sample Data created..")
                        PollVM.createPoll()
                        polls = PollVM.fetchAllPolls
                    }
                    label:{
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                } else {
                    EmptyView()
                }
            }
        }
    }
}
