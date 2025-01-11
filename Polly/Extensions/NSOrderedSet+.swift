//
//  NSOrderedSet.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import Foundation

extension NSOrderedSet {
    func toArray<T>() -> [T] {
        return array as? [T] ?? []
    }
}

extension Optional where Wrapped == NSOrderedSet {
    func toArray<T>() -> [T] {
        return self?.array as? [T] ?? []
    }
} 