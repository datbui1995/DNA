//
//  SinglyLinkedList.swift
//  DNA
//
//  Created by Dat Bui on 16/09/2021.
//

import Foundation

class SinglyLinkedList<T> {
    var head: SinglyNode<T>?
    var tail: SinglyNode<T>?
    
    public var first: SinglyNode<T>? {
        head
    }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var description: String {
        var node = head
        var text = "["
        while node != nil {
            node = node?.next
            text += "\(node?.valueDescription ?? "N/A")"
            if node != nil {
                text += ", "
            }
        }
        return text + "]"
    }
    
    public func append(node: SinglyNode<T>) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }
        
        tail = node
    }
    
    public func nodeAt(index: Int) -> SinglyNode<T>? {
        if head == nil || tail == nil { return nil }
        
        if index >= 0 {
            var count: Int = 0
            var node = head
            while node != nil {
                node = node?.next
                count += 1
                if count == index {
                    return node
                }
            }
        }
        
        return nil
    }
    
    public func removeLast() {
        
    }
    
    public func count() -> Int {
        if head == nil || tail == nil { return 0 }
        
        var node = head
        var count = 0
        
        while node != nil {
            node = node?.next
            count += 1
        }
        
        return count
    }
}
