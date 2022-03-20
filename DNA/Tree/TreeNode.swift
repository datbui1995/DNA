//
//  TreeNode.swift
//  DNA
//
//  Created by Dat Bui on 24/11/2021.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    init() {
        val = 0
        left = nil
        right = nil
    }
    
    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
