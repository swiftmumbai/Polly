//
//  String+.swift
//  Polly
//
//  Created by Brinda Davda on 11/04/25.
//

import Foundation

public extension String {
    func toDate(format: String = "MM/dd/yyyy hh:mm a", timeZone: TimeZone? = TimeZone(abbreviation: "UTC")) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        return dateFormatter.date(from: self)
    }
}
