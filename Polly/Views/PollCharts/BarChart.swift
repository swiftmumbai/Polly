//
//  BarChart.swift
//  Polly
//
//  Created by Midhet Sulemani on 12/04/25.
//

import SwiftUI
import Charts

struct BarChart: View {
    let poll: Poll
    let pollType: BarGraphType
    
    var body: some View {
        let pollOptions: [PollOption] = poll.options?.toArray() ?? []
        
        Chart(pollOptions) { option in
            let votes: [Vote] = option.votes?.toArray() ?? []
            let optionTitle = option.text ?? String()
            
            Plot {
                switch pollType {
                case .horizontal:
                    BarMark(
                        x: .value("Participants", votes.count),
                        y: .value("Choices", optionTitle),
                        width: .fixed(100),
                        height: .fixed(20)
                    )
                    .foregroundStyle(by: .value("Choices", optionTitle))
                case .vertical:
                    BarMark(
                        x: .value("Choices", optionTitle),
                        y: .value("Participants", votes.count),
                        width: .fixed(100),
                        height: .fixed(20)
                    )
                    .foregroundStyle(by: .value("Participants",
                                                votes.count))
                }
            }
            .accessibilityLabel("Poll Bar chart")
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
    BarChart(poll: SampleData.previewPoll,
             pollType: .horizontal)
    
    BarChart(poll: SampleData.previewPoll,
             pollType: .vertical)
}
