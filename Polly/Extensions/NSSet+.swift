import Foundation

extension NSSet {
    func toArray<T>() -> [T] {
        return allObjects as? [T] ?? []
    }
}

extension Optional where Wrapped == NSSet {
    func toArray<T>() -> [T] {
        return self?.allObjects as? [T] ?? []
    }
}
