//
//  VerticalBarChart.swift
//  Polly
//
//  Created by Midhet Sulemani on 29/04/25.
//

import SwiftUI
import Charts

struct VerticalBarChart: View {
    @State private var isAnimate: Bool = false
    
    let poll: Poll
    
    var body: some View {
        let pollOptions: [PollOption] = poll.options?.toArray() ?? []
        
        Chart(pollOptions) { option in
            let votes: [Vote] = option.votes?.toArray() ?? []
            let optionTitle = option.text ?? String()
            
            Plot {
                BarMark(
                    x: .value("Choices", optionTitle),
                    y: .value("Participants", isAnimate ? votes.count : 0),
                    width: .fixed(100),
                    height: .fixed(20)
                )
                .foregroundStyle(by: .value("Participants",
                                            votes.count))
            }
            .accessibilityLabel("Poll Bar chart")
            .position(by: .value("Choices", optionTitle))
        }
        .chartLegend(.hidden)
        .chartYAxis(.visible)
        .chartXAxis(.visible)
        .frame(height: 500)
        .onAppear {
            for _ in pollOptions.enumerated() {
                withAnimation(.interactiveSpring(response: 0.8,
                                                 dampingFraction: 0.8,
                                                 blendDuration: 0.8)
                    .delay(2)) {
                    isAnimate = true
                }
            }
        }
    }
}

#Preview {
    VerticalBarChart(poll: SampleData.previewPoll)
}
