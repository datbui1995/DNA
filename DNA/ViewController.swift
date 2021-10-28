//
//  ViewController.swift
//  DNA
//
//  Created by Dat Bui on 12/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
        
    }
    
    // Dynamic Array
    private func implementDynamicArray() {
        let array = DynamicArray()
        array.append(item: 1)
        array.append(item: 2)
        array.append(item: 3)
        array.printElement()
    }
    
    // Doubly Linked List
    private func implementDoublyLinkedList() {
        let linkedList = DoublyLinkedList<String>()
        linkedList.append(node: Node(value: "First Append"))
        linkedList.append(node: Node(value: "Second Append"))
        linkedList.append(node: Node(value: "Third Append"))
        linkedList.append(node: Node(value: "Forth Append"))
        print(linkedList.description)
    }
    
    // Singly Linked List
    private func implementSinglyLinkedList() {
        let linkedList = SinglyLinkedList<String>()
        linkedList.append(node: SinglyNode(value: "First"))
        linkedList.append(node: SinglyNode(value: "Second"))
        linkedList.append(node: SinglyNode(value: "Third"))
        print(linkedList.description)
    }
    
    // Stack
    private func implementStack() {
        var stack = Stack<Int>()
        stack.push(element: 2)
        stack.pop()
        stack.push(element: 3)
        stack.peek()
        stack.printAll()
    }
    
    private func implementQueue() {
        var queue = Queue<String>()
        queue.enqueue(element: "First")
        queue.enqueue(element: "Second")
        queue.dequeue()
        queue.peek()
        queue.printAll()
    }
}

