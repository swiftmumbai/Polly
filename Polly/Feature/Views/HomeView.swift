//
//  HomeView.swift
//  Polly
//
//  Created by Brinda Davda on 05/04/25.
//

import SwiftUI

struct HomeView: View {
    @ObserveInjection private var inject
    @ObservedObject var viewModel: PollVM
    
    init(viewModel: PollVM){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if viewModel.polls.isEmpty {
                    emptyStateView
                } else {
                    pollsListView
                }
            }
            .padding()
            .navigationTitle("Polls")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if !viewModel.polls.isEmpty {
                        addButton
                    }
                }
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Text("No Polls Available")
                .font(.headline)
                .foregroundColor(.gray)
            
            Button(action: createSamplePoll) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var pollsListView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(viewModel.polls.indices, id: \.self) { index in
                    Text(viewModel.polls[index].title ?? "Untitled Poll")
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
    }
    
    private var addButton: some View {
        Button(action: createSamplePoll) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
    
    private func createSamplePoll() {
        print("Sample Data created..")
        let samplePoll = PollModel(
            title: "Create Poll",
            info: "Is poll app creation successful?",
            expiryDate: Date(timeInterval: 3600 * 24, since: .now).formateToString()
        )
        viewModel.createPoll(samplePoll, ProfileModel(name: "Jone"), options: ["yes", "no"])
        
        viewModel.fetchPolls()
    }
}
