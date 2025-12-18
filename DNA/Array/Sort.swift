//
//  Sort.swift
//  DNA
//
//  Created by Dat Bui on 2/12/25.
//

class CustomSort {
    
    /// Merge Sort
    func mergeSort(arr : [Int]) -> [Int] {
        guard arr.count > 1 else { return arr }
        let mid = arr.count / 2
        
        let left = mergeSort(arr: Array(arr[0..<mid]))
        let right = mergeSort(arr: Array(arr[mid..<arr.count]))
        return merge(left: left, right: right)
    }
    
    func merge(left: [Int], right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var final: [Int] = []
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] <= right[rightIndex] {
                final.append(left[leftIndex])
                leftIndex += 1
            } else {
                final.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        if leftIndex < left.count {
            final.append(contentsOf: left[leftIndex...])
        }
        
        if rightIndex < right.count {
            final.append(contentsOf: right[rightIndex...])
        }

        return final
    }
    
    /// Selection Sort
    func selectionSort(arr: [Int]) -> [Int] {
        var minIndex = 0
        var arr = arr
        for i in 0..<arr.count {
            minIndex = i
            for j in i+1..<arr.count {
                if arr[j] < arr[minIndex] {
                    minIndex = j
                }
            }
            let temp = arr[minIndex]
            arr[minIndex] = arr[i]
            arr[i] = temp
        }
        return arr
    }
    
    /// Bubble Sort
    func bubbleSort(arr: [Int]) -> [Int] {
        var arr = arr
        for i in 0..<arr.count {
            for j in 0..<(arr.count-i-1) {
                if arr[j] > arr[j+1] {
                    let temp = arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = temp
                }
            }
        }
        return arr
    }
}

fileprivate extension CustomSort {
    /// Quick Sort
    func quickSort(arr: [Int]) -> [Int] {
        if arr.count <= 1 { return arr }
        let pivot = arr[arr.count/2]
        let left = arr.filter({ $0 < pivot })
        let equal = arr.filter { $0 == pivot }
        let right = arr.filter({ $0 > pivot })
        
        return quickSort(arr: left) + equal + quickSort(arr: right)
    }
}
