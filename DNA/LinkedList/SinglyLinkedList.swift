//
//  SinglyLinkedList.swift
//  DNA
//
//  Created by Dat Bui on 16/09/2021.
//

import Foundation

class SinglyLinkedList<T> {
    private var head: SinglyNode<T>?
    private var tail: SinglyNode<T>?
    
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
            text += "\(node?.valueDescription ?? "N/A")"
            node = node?.next
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
    
    @discardableResult
    public func nodeAt(index: Int) -> SinglyNode<T>? {
        if head == nil || tail == nil { return nil }
        
        if index < 0 { return nil }
        var count: Int = 0
        var node = head
        while node != nil {
            if count == index {
                return node
            }
            node = node?.next
            count += 1
        }
        
        return nil
    }
    
    @discardableResult
    public func removeLast() -> T? {
        if head == nil || tail == nil { return nil }
        
        guard head?.next != nil else { return pop() }
        
        var previous = head
        var current = head
        
        while let next = current?.next {
            previous = current
            current = next
        }
        
        previous?.next = nil
        tail = previous
        
        return current?.value
    }
    
    @discardableResult
    func pop() -> T? { // remove first element of LinkedList
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
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
