//
//  Date+.swift
//  Polly
//
//  Created by Brinda Davda on 11/04/25.
//

import Foundation

public extension Date {
    //format the provided date to string
    func formateToString(_ formate:String = "MM/dd/yyyy hh:mm a", timeZone:TimeZone? = TimeZone(abbreviation: "UTC")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = formate
        let stringDate = dateFormatter.string(from: self)
        return stringDate
    }
}
