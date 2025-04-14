//
//  PollCharts.swift
//  Polly
//
//  Created by Midhet Sulemani on 12/04/25.
//

import SwiftUI
import Charts

struct PollCharts: View {
    var data = PollData.preview
    
    var body: some View {
        chart
            .padding()
            .navigationBarTitle("Ways to greet")
    }
    
    private var chart: some View {
        Chart(data) { poll in
            Plot {
                BarMark(
                    x: .value("Participants", poll.participants),
                    y: .value("Choices", poll.choice),
                    width: .fixed(100),
                    height: .fixed(20)
                )
                .foregroundStyle(by: .value("Choices", poll.choice))
            }
            .accessibilityLabel("Poll Bar chart")
            .symbol(by: .value("Choices", poll.choice))
            .interpolationMethod(.catmullRom)
            .position(by: .value("Choices", poll.choice))
        }
        .chartLegend(.visible)
        .chartLegend(position: .top)
        .chartYAxis(.hidden)
        .chartXAxis(.visible)
        .frame(height: 500)
    }
}

#Preview {
    PollCharts()
}
