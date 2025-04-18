//
//  PieChart.swift
//  Polly
//
//  Created by Midhet Sulemani on 16/04/25.
//

import SwiftUI
import Charts

struct PieChart: View {
    let poll: Poll
    
    var body: some View {
        let pollOptions: [PollOption] = poll.options?.toArray() ?? []
        
        Chart(pollOptions) { option in
            let votes: [Vote] = option.votes?.toArray() ?? []
            let optionTitle = option.text ?? String()
            
            SectorMark(angle: .value(optionTitle, votes.count))
                .foregroundStyle(by: .value(optionTitle, optionTitle))
                .accessibilityLabel("Poll Pie chart")
        }
        .chartLegend(.visible)
        .frame(height: 200)
    }
        
    
}

#Preview {
    PieChart(poll: SampleData.previewPoll)
}
