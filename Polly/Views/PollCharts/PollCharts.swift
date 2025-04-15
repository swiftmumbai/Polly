//
//  PollCharts.swift
//  Polly
//
//  Created by Midhet Sulemani on 12/04/25.
//

import SwiftUI
import Charts

struct PollCharts: View {
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
            
            Plot {
                BarMark(
                    x: .value("Participants", votes.count),
                    y: .value("Choices", optionTitle),
                    width: .fixed(100),
                    height: .fixed(20)
                )
                .foregroundStyle(by: .value("Choices", optionTitle))
            }
            .accessibilityLabel("Poll Bar chart")
            .symbol(by: .value("Choices", optionTitle))
            .interpolationMethod(.catmullRom)
            .position(by: .value("Choices", optionTitle))
        }
        .chartLegend(.visible)
        .chartLegend(position: .top)
        .chartYAxis(.hidden)
        .chartXAxis(.visible)
        .frame(height: 200)
    }
}

#Preview {
    PollCharts()
}
