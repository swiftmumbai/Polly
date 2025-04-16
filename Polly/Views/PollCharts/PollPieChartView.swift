//
//  PollPieChartView.swift
//  Polly
//
//  Created by Midhet Sulemani on 16/04/25.
//

import SwiftUI
import Charts

struct PollPieChartView: View {
    var data = SampleData.createSampleData()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(data.polls) { poll in
                    VStack {
                        Text(poll.title ?? String())
                            .font(.title)
                            .multilineTextAlignment(.center)
                        
                        chart(poll: poll)
                        
                        Divider()
                            .padding()
                    }
                }
            }
        }
        .padding()
    }
        
    @ViewBuilder
    private func chart(poll: Poll) -> some View {
        let pollOptions: [PollOption] = poll.options?.toArray() ?? []
        
        Chart(pollOptions) { option in
            let votes: [Vote] = option.votes?.toArray() ?? []
            let optionTitle = option.text ?? String()
            
            SectorMark(angle: .value(optionTitle, votes.count))
                .foregroundStyle(by: .value(optionTitle, optionTitle))
                .accessibilityLabel("Poll Bar chart")
        }
        .chartLegend(.visible)
        .frame(height: 200)
    }
}

#Preview {
    PollPieChartView()
}
