//
//  PollChartView.swift
//  Polly
//
//  Created by Midhet Sulemani on 18/04/25.
//

import SwiftUI
import Charts

struct PollChart: View {
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
                            PieChart(poll: poll)
                        case .barGraph(let graphType):
                            BarChart(poll: poll,
                                     pollType: graphType)
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
    PollChart(chartType: .barGraph(type: .horizontal))
    
    PollChart(chartType: .barGraph(type: .vertical))
    
    PollChart(chartType: .pieChart)
}
