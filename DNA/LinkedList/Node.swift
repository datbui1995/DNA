//
//  Node.swift
//  DNA
//
//  Created by Dat Bui on 14/09/2021.
//

import Foundation

public class Node<T> {
    
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
    public var valueDescription: String {
        return String(describing: value)
    }
}
