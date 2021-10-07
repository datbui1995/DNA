

/*
 Array is a collection of items stored at contiguous memory locations. The idea is to store multiple items of same type together.
 This makes it easier to calculate the position of each element by simply adding an offset to a base value.
 Runtime access: O(1)
 Runtime insert: O(n)
 Runtime delete: O(n)
 Runtime append: O(1)
 
 */


class DynamicArray {
    
    private var capacity: Int
    private var array: [Int]
    private var length: Int
    
    init() {
        self.capacity = 1
        self.array = []
        self.length = 0
    }
    
    public func sizeArray() -> Int { length }
    
    public func isEmpty() -> Bool {
        array.isEmpty
    }
    
    public func capacityArray() -> Int { capacity }
    
    public func item(at index: Int) -> Int? {
        if index >= capacity || index >= length {
            return nil
        }
        
        if index < 0 {
            return nil
        }
        
        return array[index]
    }
    
    public func append(item: Int) {
        if sizeArray() == capacity || sizeArray() == 0 {
            growArray()
        }
        array[length] = item
        length += 1
    }
    
    public func remove(at index: Int) {
        if length < capacity / 4 {
            shrinkArray()
        }
        
    }
    
    public func printElement() {
        print(self.elements())
    }
    
    private func growArray() {
        capacity *= 2
        
        var newArray = Array(repeating: 0, count: capacity)

        for index in array.indices {
            newArray[index] = array[index]
        }

        array = newArray
    }
    
    private func shrinkArray() {
        capacity /= 2
        
        var newArray = Array(repeating: 0, count: capacity)
        
        for index in array.indices {
            newArray[index] = array[index]
        }
        
        array = newArray
    }
    
    public func elements() -> [Int] {
        var result: [Int] = Array(repeating: 0, count: length)
        
        for index in 0..<length {
            result[index] = array[index]
        }
        
        return result
    }
}
