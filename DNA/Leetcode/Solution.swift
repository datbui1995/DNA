//
//  Solution.swift
//  DNA
//
//  Created by Dat Bui on 20/03/2022.
//

import Foundation

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
    
    /*
     Given an array of integers arr, return true if and only if it is a valid mountain array.

     Recall that arr is a mountain array if and only if:

     arr.length >= 3
     There exists some i with 0 < i < arr.length - 1 such that:
     arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
     arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
     
     Example 1:

     Input: arr = [2,1]
     Output: false
     Example 2:

     Input: arr = [3,5,5]
     Output: false
     Example 3:

     Input: arr = [0,3,2,1]
     Output: true
     */
    
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count < 3 { return false }
        var max = arr.first!
        var maxIndex = 0
        for (index, number) in arr.enumerated() {
            if max < number {
                max = number
                maxIndex = index
            }
        }
        
        if maxIndex == 0 || maxIndex == arr.count - 1 { return false }
        
        for index in 0..<maxIndex {
            if arr[index] >= arr[index + 1] {
                return false
            }
        }
        
        for index in maxIndex..<(arr.count - 1) {
            if arr[index] <= arr[index + 1] {
                return false
            }
        }
        return true
    }
}
