//
//  PollChartView.swift
//  Polly
//
//  Created by Midhet Sulemani on 18/04/25.
//

import SwiftUI
import Charts

struct PollChartView: View {
    let chartType: PollTypes
    
    var data = SampleData.createSampleData()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(data.polls) { poll in
                    VStack {
                        Text(poll.title ?? String())
                            .font(.title)
                            .multilineTextAlignment(.center)
                        
                        switch chartType {
                        case .pieChart:
                            PollPieChartView(poll: poll)
                        case .barGraph:
                            PollBarChartView(poll: poll)
                        }
                        
                        Divider()
                            .padding()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    PollChartView(chartType: .barGraph)
    
    PollChartView(chartType: .pieChart)
}
