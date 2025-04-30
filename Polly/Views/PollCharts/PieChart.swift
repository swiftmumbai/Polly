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
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        let pollOptions: [PollOption] = poll.options?.toArray() ?? []
        
        Chart(pollOptions) { option in
            let votes: [Vote] = option.votes?.toArray() ?? []
            let optionTitle = option.text ?? String()
            
            SectorMark(angle: .value(optionTitle, isAnimate ? votes.count : 0))
                .foregroundStyle(by: .value(optionTitle, optionTitle))
                .accessibilityLabel("Poll Pie chart")
        }
        .chartLegend(.visible)
        .frame(height: 200)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).delay(2)) {
                isAnimate = true
            }
        }
    }
        
    
}

#Preview {
    PieChart(poll: SampleData.previewPoll)
}
