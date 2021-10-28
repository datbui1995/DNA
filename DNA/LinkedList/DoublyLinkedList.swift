
/*
 Linked list is a linear data structure, in which elements are not stored at contiguous memory locations.
 A linked list consists of nodes where each node contains data field and reference to the next node of the list
 Runtime access: O(n)
 Runtime insert: O(n)
 Runtime delete: O(n)
 Runtime append: O(1)
 */

import Foundation

public class DoublyLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node?.valueDescription ?? "N/A")"
            node = node?.next
            if node != nil { text += ", " }
        }
        
        return text + "]"
    }
    
    public func append(node: Node<T>) {
        if let tail = tail {
            node.previous = tail
            tail.next = node
        } else {
            head = node
        }
        tail = node
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if head == nil || tail == nil { return nil }
        
        if index < 0 { return nil }
        var node = head
        var count = 0
        while node != nil {
            if count == index {
                return node
            }
            node = node?.next
            count += 1
        }
        
        return nil
    }
    
    public func remove(node: Node<T>) {
        let previous = node.previous
        let next = node.next
        
        if let previous = previous {
            previous.next = next
        } else {
            head = next
        }
        
        next?.previous = previous
        
        if next == nil {
            tail = previous
        }
        
        node.previous = nil
        node.next = nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    
}
