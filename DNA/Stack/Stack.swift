//
//  Stack.swift
//  DNA
//
//  Created by Dat Bui on 29/10/2021.
//

import Foundation

struct Stack<Element> {
    
    private var array: [Element] = []
    
    // Push: add element to the last of Stack
    mutating func push(element: Element) {
        array.append(element)
    }
    
    // Pop: remove and return last element of Stack
    @discardableResult
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    // Peek: return last element of Stack
    @discardableResult
    mutating func peek() -> Element? {
        return array.last
    }
    
    mutating func printAll() {
        print(array)
    }
    
}
