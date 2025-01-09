//
//  LogType.swift
//  Utils
//
//  Created by Raj Raval on 5/1/25.
//

import Foundation
import os

private enum LogType: String {
    case error = "[🛑 ERROR]"
    case warning = "[⚠️ WARNING]"
    case message = "[💬 MESSAGE]"
    case info = "[ℹ️ INFO]"
}

open class Log {

    static private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.rajraval.Polly", category: "Polly")

    nonisolated(unsafe) public static var shouldLog: Bool = {
        #if DEBUG
            true
        #else
            false
        #endif
    }()

    static private func log(
        logType: LogType,
        messages: Any...,
        file: String,
        function: String,
        line: Int
    ) {
        if Self.shouldLog {
            let message = [
                logType.rawValue,
                URL(fileURLWithPath: file).lastPathComponent,
                function,
                String(line)
            ] + messages.map { "\($0)" }
            let log = message.joined(separator: " ")
            switch logType {
            case .error:
                logger.log(level: .error, "\(log)")
            case .warning:
                logger.warning("\(log)")
            case .message:
                logger.log(level: .default, "\(log)")
            case .info:
                logger.log(level: .default, "\(log)")
            }
        }
    }

    public static func info(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .info, messages: messages, file: file, function: function, line: line)
    }

    public static func message(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .message, messages: messages, file: file, function: function, line: line)
    }

    public static func warning(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .warning, messages: messages, file: file, function: function, line: line)
    }

    public static func error(
        _ error: Error,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(logType: .error, messages: error, file: file, function: function, line: line)
    }

}
