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
        switch pollType {
        case .horizontal:
            HorizontalBarChart(poll: poll)
        case .vertical:
            VerticalBarChart(poll: poll)
        }
    }
}

#Preview {
    BarChart(poll: SampleData.previewPoll,
             pollType: .horizontal)
    
    BarChart(poll: SampleData.previewPoll,
             pollType: .vertical)
}
