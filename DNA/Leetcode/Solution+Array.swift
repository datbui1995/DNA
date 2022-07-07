//
//  Solution.swift
//  DNA
//
//  Created by Dat Bui on 20/03/2022.
//

import Foundation

class Solution {
    
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
    
    /*
     Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
     
     You must write an algorithm with O(log n) runtime complexity.
     
     Input: nums = [1,3,5,6], target = 5
     Output: 2
     
     Input: nums = [1,3,5,6], target = 2
     Output: 1
     
     Input: nums = [1,3,5,6], target = 7
     Output: 4
     */
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lowerIndex = 0
        var upperIndex = nums.count - 1
        while true {
            let currentIndex = (lowerIndex + upperIndex) / 2
            if nums[currentIndex] == target {
                return currentIndex
            } else if lowerIndex > upperIndex {
                return lowerIndex
            } else {
                if nums[currentIndex] > target {
                    upperIndex = currentIndex - 1
                } else {
                    lowerIndex = currentIndex + 1
                }
            }
        }
    }
    
    /*
     You are given an array of people, people, which are the attributes of some people in a queue (not necessarily in order). Each people[i] = [hi, ki] represents the ith person of height hi with exactly ki other people in front who have a height greater than or equal to hi.
     
     Reconstruct and return the queue that is represented by the input array people. The returned queue should be formatted as an array queue, where queue[j] = [hj, kj] is the attributes of the jth person in the queue (queue[0] is the person at the front of the queue).
     
     
     
     Example 1:
     
     Input: people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]
     Output: [[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]
     Explanation:
     Person 0 has height 5 with no other people taller or the same height in front.
     Person 1 has height 7 with no other people taller or the same height in front.
     Person 2 has height 5 with two persons taller or the same height in front, which is person 0 and 1.
     Person 3 has height 6 with one person taller or the same height in front, which is person 1.
     Person 4 has height 4 with four people taller or the same height in front, which are people 0, 1, 2, and 3.
     Person 5 has height 7 with one person taller or the same height in front, which is person 1.
     Hence [[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]] is the reconstructed queue.
     Example 2:
     
     Input: people = [[6,0],[5,0],[4,0],[3,2],[2,2],[1,4]]
     Output: [[4,0],[5,0],[2,2],[3,2],[1,4],[6,0]]
     */
    
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        people.sorted(by: { ($0[0] == $1[0]) ? $0[1] < $1[1] : $0[0] > $1[0] })
            .forEach({result.insert($0, at: $0[1])})
        return result
    }
}
