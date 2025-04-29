//
//  PollChartOptions.swift
//  Polly
//
//  Created by Midhet Sulemani on 29/04/25.
//

import SwiftUI

struct PollChartOptions: View {
    private var options = PollTypes.allCases
    @State private var selectedOption = PollTypes.pieChart
    
    var body: some View {
        VStack {
            Picker(String(), selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option.title)
                }
            }
            .pickerStyle(.segmented)

            switch selectedOption {
            case .pieChart:
                PollChart(chartType: .pieChart)
            case .barGraph(let type):
                switch type {
                    case .vertical:
                    PollChart(chartType: .barGraph(type: .vertical))
                case .horizontal:
                    PollChart(chartType: .barGraph(type: .horizontal))
                }
            }
        }
        .padding()
    }
}

#Preview {
    PollChartOptions()
}
