//
//  PollCharts.swift
//  Polly
//
//  Created by Midhet Sulemani on 12/04/25.
//

import SwiftUI
import Charts

enum Constants {
    static let previewChartHeight: CGFloat = 100
    static let detailChartHeight: CGFloat = 300
}

enum ChartStrideBy: Identifiable, CaseIterable {
    case second
    case minute
    case hour
    case day
    case weekday
    case weekOfYear
    case month
    case year
    
    var id: String { title }
    
    var title: String {
        switch self {
        case .second:
            return "Second"
        case .minute:
            return "Minute"
        case .hour:
            return "Hour"
        case .day:
            return "Day"
        case .weekday:
            return "Weekday"
        case .weekOfYear:
            return "Week of Year"
        case .month:
            return "Month"
        case .year:
            return "Year"
        }
    }
    
    var time: Calendar.Component {
        switch self {
        case .second:
            return .second
        case .minute:
            return .minute
        case .hour:
            return .hour
        case .day:
            return .day
        case .weekday:
            return .weekday
        case .weekOfYear:
            return .weekOfYear
        case .month:
            return .month
        case .year:
            return .year
        }
    }
}

func date(year: Int, month: Int, day: Int = 1, hour: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minutes, second: seconds)) ?? Date()
}

/// Data for the sales by location and weekday charts.
enum LocationData {
    /// A data series for the lines.
    struct Series: Identifiable {
        /// The name of the city.
        let city: String

        /// Average daily sales for each weekday.
        /// The `weekday` property is a `Date` that represents a weekday.
        let sales: [(weekday: Date, sales: Int)]

        /// The identifier for the series.
        var id: String { city }
    }
    
    /// Sales by location and weekday for the last 7 days.
    static let last7Days: [Series] = [
        .init(city: "Cupertino", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 54),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 88),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 67)
        ]),
        .init(city: "San Francisco", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 90),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 137)
        ])
    ]

    /// Sales by location and weekday for the last 30 days.
    static let last30Days: [Series] = [
        .init(city: "Cupertino", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 54),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 88),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 67),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 54),
            (weekday: date(year: 2022, month: 5, day: 9), sales: 47),
            (weekday: date(year: 2022, month: 5, day: 10), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 11), sales: 71),
            (weekday: date(year: 2022, month: 5, day: 12), sales: 56),
            (weekday: date(year: 2022, month: 5, day: 13), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 14), sales: 40),
            (weekday: date(year: 2022, month: 5, day: 15), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 16), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 17), sales: 58),
            (weekday: date(year: 2022, month: 5, day: 18), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 19), sales: 62),
            (weekday: date(year: 2022, month: 5, day: 20), sales: 77),
            (weekday: date(year: 2022, month: 5, day: 21), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 22), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 23), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 24), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 25), sales: 58),
            (weekday: date(year: 2022, month: 5, day: 26), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 27), sales: 68),
            (weekday: date(year: 2022, month: 5, day: 28), sales: 43),
            (weekday: date(year: 2022, month: 5, day: 29), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 30), sales: 125)
        ]),
        .init(city: "San Francisco", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 90),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 137),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 99),
            (weekday: date(year: 2022, month: 5, day: 9), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 10), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 11), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 12), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 13), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 14), sales: 122),
            (weekday: date(year: 2022, month: 5, day: 15), sales: 147),
            (weekday: date(year: 2022, month: 5, day: 16), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 17), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 18), sales: 62),
            (weekday: date(year: 2022, month: 5, day: 19), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 20), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 21), sales: 122),
            (weekday: date(year: 2022, month: 5, day: 22), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 23), sales: 95),
            (weekday: date(year: 2022, month: 5, day: 24), sales: 63),
            (weekday: date(year: 2022, month: 5, day: 25), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 26), sales: 74),
            (weekday: date(year: 2022, month: 5, day: 27), sales: 79),
            (weekday: date(year: 2022, month: 5, day: 28), sales: 93),
            (weekday: date(year: 2022, month: 5, day: 29), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 30), sales: 87)
        ])
    ]

    /// The best weekday and location for the last 30 days.
    static let last30DaysBest = (
        city: "San Francisco",
        weekday: date(year: 2022, month: 5, day: 8),
        sales: 137
    )

    /// The best weekday and location for the last 12 months.
    static let last12MonthsBest = (
        city: "San Francisco",
        weekday: date(year: 2022, month: 5, day: 8),
        sales: 113
    )

    /// Sales by location and weekday for the last 12 months.
    static let last12Months: [Series] = [
        .init(city: "Cupertino", sales: [
            (weekday: date(year: 2022, month: 5, day: 2), sales: 64),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 60),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 47),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 105),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 67)
        ]),
        .init(city: "San Francisco", sales: [
            (weekday: date(year: 2022, month: 5, day: 2), sales: 57),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 56),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 60),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 77),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 113)
        ])
    ]
}

struct PollCharts: View {
    var data = LocationData.last7Days
    
    @State private var barWidth = 13.0
    @State private var interpolationMethod: InterpolationMethod = .cardinal
    @State private var strideBy: ChartStrideBy = .day
    
    var body: some View {
        chart
            .navigationBarTitle("Hello", displayMode: .inline)
    }
    
    private var chart: some View {
        Chart(data) { series in
            ForEach(series.sales, id: \.weekday) { element in
                Plot {
                    BarMark(
                        x: .value("Day", element.weekday, unit: .day),
                        y: .value("Sales", element.sales),
                        width: .fixed(barWidth)
                    )
                    .foregroundStyle(by: .value("City", series.city))
                }
                .accessibilityLabel("Label")
                .accessibilityValue("Value")
            }
            .symbol(by: .value("City", series.city))
            .interpolationMethod(.catmullRom)
            .position(by: .value("City", series.city))
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: strideBy.time)) { _ in
                AxisTick()
                AxisGridLine()
                AxisValueLabel(format: .dateTime.weekday(.abbreviated),
                               centered: true)
            }
        }
        .chartLegend(.visible)
        .chartLegend(position: .top)
        // For the simple overview chart,
        // skip individual labels and only set the chartDescriptor
//        .accessibilityChartDescriptor(self)
        .chartYAxis(.automatic)
        .chartXAxis(.automatic)
        .frame(height: Constants.detailChartHeight)
    }
}

#Preview {
    PollCharts()
}
