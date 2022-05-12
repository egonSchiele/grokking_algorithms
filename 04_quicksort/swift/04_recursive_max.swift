import Foundation

func max(list : [Int]) -> Int {
    if list.count == 2 {
        return (list[0] > list[1]) ? list[0] : list[1]
    } else if list.count < 2 {
        return list.first ?? 0
    }
    var tempArray = list
    tempArray.remove(at: 0)
    let subMax = max(list: tempArray)
    return (list[0] > subMax) ? list[0] : subMax
}

print(max(list: [1, 5, 10, 25, 16, 1])) // => 25

// MARK: - Another implementation:
let arrayOne = [2.0, 4.7, 231, 1, 6, 8, 0, 4.1, 0.4, 100]

// Method for finding the max element in array:
@discardableResult func maxElement<T: Numeric & Comparable>(of array: [T]) -> T? {
    /// Checking for empty array and unwraping of 'currentElement' property.
    guard !array.isEmpty else { return nil }
    /// Base case.
    guard array.count != 1 else { return array.first! }
    /// In swift all method's parameters are constants, so we've created 'mutubleArray'.
    var mutubleArray = array
    
    array.first! > array[1] ? mutubleArray.remove(at: 1) : mutubleArray.remove(at: 0)
    
    /// Recursive case.
    return maxElement(of: mutubleArray)
}

maxElement(of: arrayOne) // Result => 231
