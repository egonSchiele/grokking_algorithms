import Foundation

func count(list : [Int]) -> Int {
    if list.count == 0 {
        return 0
    }
    var tempArray = list
    tempArray.remove(at: 0)
    return 1 + count(list: tempArray)
}

print(count(list: [1, 2, 3, 4])) // => 4


// MARK: - Another implementation:
let arrayOne = [2.0, 4.7, 231, 1, 6, 8, 0, 4.1, 0.4, 100]

// Method for finding the array's count:
@discardableResult func count<T>(of array: [T]) -> Int {
    /// Checking for empty array.
    /// Base case.
    guard !array.isEmpty else { return 0 }
    /// In swift all method's parameters are constants, so we've created 'mutubleArray'.
    var mutubleArray = array
    
    /// Recursive case
    mutubleArray.removeFirst()
    return 1 + count(of: mutubleArray)
}

count(of: arrayOne) // Result => 10
