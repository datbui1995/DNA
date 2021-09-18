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
        
        implementLinkedList()
    }
    
    // Dynamic Array
    private func implementDynamicArray() {
        let array = DynamicArray()
        array.append(item: 1)
        array.append(item: 2)
        array.append(item: 3)
        array.printElement()
    }
    
    // LinkedList
    private func implementLinkedList() {
        let linkedList = DoublyLinkedList<String>()
        linkedList.append(node: Node(value: "First Append"))
        linkedList.append(node: Node(value: "Second Append"))
        linkedList.append(node: Node(value: "Third Append"))
        linkedList.append(node: Node(value: "Forth Append"))
    }
}

