import Foundation

func sum(list : [Int]) -> Int {
    if list.count == 0 {
        return 0
    }
    var tempArray = list
    tempArray.remove(at: 0)
    return list[0] + sum(list: tempArray)
}

print(sum(list: [1, 2, 3, 4])) // => 10


// MARK: - Another implementation:
let arrayOne = [2.0, 4.7, 231, 1, 6, 8, 0, 4.1, 0.4, 100]

// Method for finding the sum:
@discardableResult func summarize<T: Numeric>(_ array: [T]) -> T {
    /// Checking for empty array and unwraping of 'sum' property.
    /// Base case.
    guard !array.isEmpty else { return 0 }
    /// In swift all method's parameters are constants, so we've created 'mutubleArray'.
    var mutubaleArray = array
    
    /// Recursive case.
    mutubaleArray.removeFirst()
    return array.first! + summarize(mutubaleArray)
}

summarize(arrayOne) // Result => 357.2
