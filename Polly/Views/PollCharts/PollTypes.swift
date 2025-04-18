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

enum PollTypes {
    case pieChart
    case barGraph(type: BarGraphType)
}
