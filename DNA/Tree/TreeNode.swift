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


class Solution {
    func isValidBST(node: TreeNode?) -> Bool {
        isBst(node, min: Int.min, max: Int.max)
    }
    
    private func isBst(_ node: TreeNode?, min: Int, max: Int) -> Bool {
        if node == nil { return true }
        if node!.val <= min || node!.val >= max { return false }
        return isBst(node!.left, min: min, max: node!.val) && isBst(node!.right, min: node!.val, max: max)
    }
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var values: [Int] = []
        values.append(root!.val)
        if root?.left != nil {
            values.append(contentsOf: preorderTraversal(root?.left))
        }
        if root?.right != nil {
            values.append(contentsOf: preorderTraversal(root?.right))
        }
        return values
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var values: [Int] = []
        
        if root?.left != nil {
            values.append(contentsOf: inorderTraversal(root?.left))
        }
        values.append(root!.val)
        if root?.right != nil {
            values.append(contentsOf: inorderTraversal(root?.right))
        }
        return values
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var values: [Int] = []
        
        if root?.left != nil {
            values.append(contentsOf: postorderTraversal(root?.left))
        }
        
        if root?.right != nil {
            values.append(contentsOf: postorderTraversal(root?.right))
        }
        
        values.append(root!.val)
        return values
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [TreeNode]()
        var output = [[Int]]()
        queue.append(root)
        
        while queue.isEmpty == false {
            // start new level
            // number of elements in the current level
            var levelCount = queue.count
            var levelNodes = [Int]()
            while levelCount > 0 {
                let node = queue.first!
                queue.removeFirst()
                levelCount -= 1
                levelNodes.append(node.val)
                // Add Left child node
                if let left = node.left{
                    queue.append(left)
                }
                // Add right child node
                if let right = node.right{
                    queue.append(right)
                }
            }
            // Add nodes by level
            output.append(levelNodes)
        }
        return output
    }
}
