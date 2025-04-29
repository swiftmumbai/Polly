//
//  PollTypes.swift
//  Polly
//
//  Created by Midhet Sulemani on 18/04/25.
//

import Foundation

enum BarGraphType {
    case horizontal
    case vertical
}

enum PollTypes: CaseIterable, Hashable {
    case pieChart
    case barGraph(type: BarGraphType)
    
    static var allCases: [PollTypes] {
        [.pieChart, .barGraph(type: .horizontal), .barGraph(type: .vertical)]
    }
    
    var title: String {
        switch self {
        case .pieChart:
            return "Pie Chart"
        case .barGraph(type: .horizontal):
            return "Horizontal Bar Graph"
        case .barGraph(type: .vertical):
            return "Vertical Bar Graph"
        }
    }
}
