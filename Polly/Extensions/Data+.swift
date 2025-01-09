//
//  Data+.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import Foundation

public extension Data {
    mutating func append(
        _ string: String,
        encoding: String.Encoding = .utf8
    ) {
        guard let data = string.data(using: encoding) else {
            return
        }
        append(data)
    }

    /// NSString gives us a nice sanitized debugDescription
    var prettyPrintToJSON: NSString {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else {
            return (String(data: self, encoding: .utf8) ?? "Cannot render string in .UTF8 format") as NSString
        }

        return prettyPrintedString
    }
}
