//
//  HashTable.swift
//  DNA
//
//  Created by Dat Bui on 02/11/2021.
//

import Foundation

struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    public private(set) var count = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: [], count: capacity)
        
    }
    
    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(for: key)
        }
        
        set {
            if let value = newValue {
                update(value: value, for: key)
            } else {
                removeValue(for: key)
            }
        }
    }
    
    public func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        return buckets[index].first(where: { element in
            element.key == key
        })?.value
    }
    
    @discardableResult
    public mutating func update(value: Value, for key: Key) -> Value? {
        let index = self.index(for: key)
        
        if let (i, element) = buckets[index].enumerated().first(where: { offset, data in
            data.key == key
        }) {
            let oldValue = element.value
            buckets[index][i].value = value
            return oldValue
        }
        
        buckets[index].append((key, value))
        count += 1
        return nil
    }
    
    @discardableResult
    public mutating func removeValue(for key: Key) -> Value? {
        let index = self.index(for: key)
        
        if let (i, element) = buckets[index].enumerated().first(where: { index, item in
            item.key == key
        }) {
            buckets[index].remove(at: i)
            count -= 1
            return element.value
        }
        
        return nil
    }
}
