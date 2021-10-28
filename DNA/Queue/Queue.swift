//
//  Queue.swift
//  DNA
//
//  Created by Dat Bui on 29/10/2021.
//

import Foundation

struct Queue<T> {
    private var list: [T] = []
    
    mutating func enqueue(element: T) {
        list.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        list.removeFirst()
        return element
    }
    
    @discardableResult
    mutating func peek() -> T? {
        return list.first
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func printAll() {
        print(list)
    }
}
