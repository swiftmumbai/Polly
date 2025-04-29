//
//  HorizontalBarChart.swift
//  Polly
//
//  Created by Midhet Sulemani on 29/04/25.
//

import SwiftUI
import Charts

struct HorizontalBarChart: View {
    let poll: Poll
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        let pollOptions: [PollOption] = poll.options?.toArray() ?? []
        
        Chart(pollOptions) { option in
            let votes: [Vote] = option.votes?.toArray() ?? []
            let optionTitle = option.text ?? String()
            
            Plot {
                BarMark(
                    x: .value("Participants", isAnimate ? votes.count : 0),
                    y: .value("Choices", optionTitle),
                    width: .fixed(100),
                    height: .fixed(20)
                )
                .foregroundStyle(by: .value("Choices", optionTitle))
            }
            .accessibilityLabel("Poll Bar chart")
            .position(by: .value("Choices", optionTitle))
        }
        .chartLegend(.visible)
        .chartLegend(position: .top)
        .chartYAxis(.hidden)
        .chartXAxis(.visible)
        .frame(width: 350)
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
    HorizontalBarChart(poll: SampleData.previewPoll)
}
