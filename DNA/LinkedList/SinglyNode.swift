//
//  SinglyNode.swift
//  DNA
//
//  Created by Dat Bui on 19/09/2021.
//

import Foundation

public class SinglyNode<T> {
    
    var value: T
    var next: SinglyNode<T>?
    
    public var valueDescription: String {
        return String(describing: value)
    }
    
    init(value: T) {
        self.value = value
    }
}
