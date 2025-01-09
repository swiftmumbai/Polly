//
//  URL+.swift
//  Database
//
//  Created by Raj Raval on 19/09/24.
//

import Foundation

public extension URL {

    static var appGroup: String {
        return "group.com.rajraval.Polly"
    }

    static func storeURL(databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Unable to create URL for \(appGroup)")
        }
        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }

}
