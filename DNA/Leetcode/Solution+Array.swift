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
}
