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
        
        implementSinglyLinkedList()
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
    }
    
    private func implementSinglyLinkedList() {
        let linkedList = SinglyLinkedList<String>()
        linkedList.append(node: SinglyNode(value: "First"))
        linkedList.append(node: SinglyNode(value: "Second"))
        print(linkedList.description)
    }
}

