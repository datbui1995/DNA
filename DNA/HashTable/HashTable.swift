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


/// implementation using open addressing
class MyHashTable {
    class DictStructure {
        var key: String
        var value: Any
        var isDeleted: Bool = false
        
        init(key: String, value: Any) {
            self.key = key
            self.value = value
        }
    }
    
    let initialCapacity: Int
    private var stogare: [DictStructure?]
    private var usageCount: Int = 0
    private var thresholdRate = 0.5
    
    
    /// initial capacity should greater than 0
    init(capacity: Int = 5) {
        initialCapacity = capacity
        stogare = Array(repeating: nil, count: capacity)
    }
    
    private func index(from key: String) -> Int {
        return abs(key.hashValue) % initialCapacity
    }
    
    private func nextIndex(from index: Int) -> Int {
        var idx = index + 1
        if idx == stogare.count {
            idx = 0
        }
        return idx
    }
    
    private func probAvailableIndex(from idx: Int) -> Int? {
        var index = idx
        var count = 1
        while stogare[index] != nil && stogare[index]?.isDeleted == false {
            index = nextIndex(from: index)
            count += 1
            if count > stogare.count {
                return nil
            }
        }
        
        return index
    }
    
    private func probDictAndIndex(for key: String, from idx: Int) -> (DictStructure?, Int?) {
        guard let _ = stogare[idx] else { return (nil, idx) }
        var index = idx
        var count = 1
        while stogare[index] != nil {
            if let dict = stogare[index], dict.key == key, dict.isDeleted == false {
                return (dict, index)
            }
            
            index = nextIndex(from: index)
            count += 1
            if count > stogare.count {
                return (nil, nil)
            }
        }
        return (nil, index)
    }
    
    private func expandAndRehash() {
        print(#function)
        let currentStorage = stogare
        stogare = Array(repeating: nil, count: stogare.count * 2)
        usageCount = 0
        for dict in currentStorage {
            if let dict = dict, dict.isDeleted == false {
                set(key: dict.key, value: dict.value)
            }
        }
    }
    
    /// return value
    func get(key: String) -> Any? {
        let idx = index(from: key)
        let dict = probDictAndIndex(for: key, from: idx).0
        return dict?.value
    }
    
    /// set value
    func set(key: String, value: Any) {
        if Double(usageCount) / Double(stogare.count) > thresholdRate {
            expandAndRehash()
        }
        
        let index = index(from: key)
        let dictAndIndex = probDictAndIndex(for: key, from: index)
        
        if let dict = dictAndIndex.0 {
            print("key: \(key) exist, replace value: \(String(describing: dict.value)) with \(value) ")
            dict.value = value
        } else if let i = probAvailableIndex(from: index) {
            print("key: \(key) not exist, store value: \(value) at \(i) ")
            stogare[i] = DictStructure(key: key, value: value)
            usageCount += 1
        } else {
            print("Warning: Run out of space!")
        }
    }
    
    func remove(key: String) {
        let idx = index(from: key)
        let dictAndIndex = probDictAndIndex(for: key, from: idx)
        print("delete key: \(key)")
        if dictAndIndex.0?.isDeleted == false, let i = dictAndIndex.1 {
            dictAndIndex.0?.isDeleted = true
            usageCount -= 1
            print("Found value: \(String(describing: dictAndIndex.0?.value)), deleted dict at index: \(i)")
        }
    }
}

