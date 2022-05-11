import Foundation

let arrayOne = [2.0, 4.7, 231, 1, 6, 8, 0, 4.1, 0.4, 100]
let arrayTwo = [1]

// Method for finding the sum:
@discardableResult func summarize<T: Numeric>(_ array: [T]) -> T? {
    /// Checking for empty array and unwraping of 'sum' property.
    guard !array.isEmpty, var sum = array.first else { return nil }
    
    /// In swift all method's parameters are constants, so we've created 'mutubleArray'.
    var mutubaleArray = array
    
    /// Base case.
    if mutubaleArray.count == 1 {
        return mutubaleArray.first!
    /// Recursive case.
    } else {
        mutubaleArray.removeFirst()
        sum += summarize(mutubaleArray)!
    }
    
    return sum
}

// Method for finding the array's count:
@discardableResult func count<T>(of array: [T]) -> Int? {
    /// Checking for empty array.
    guard !array.isEmpty else { return nil }
    /// In swift all method's parameters are constants, so we've created 'mutubleArray'.
    var mutubleArray = array
    /// If you want - you can make like 'var number = 1'
    var number = mutubleArray.startIndex + 1
    
    /// Base case.
    if mutubleArray.count == 1 {
        return 1
    /// Recursive case.
    } else {
        mutubleArray.removeFirst()
        number += count(of: mutubleArray)!
    }
    
    return number
}

// Method for finding the max element in array:
@discardableResult func maxElement<T: Comparable>(of array: [T]) -> T? {
    /// Checking for empty array and unwraping of 'currentElement' property.
    guard !array.isEmpty, var currentElement = array.first else { return nil }
    /// In swift all method's parameters are constants, so we've created 'mutubleArray'.
    var mutubleArray = array
    
    /// Base case.
    if mutubleArray.count == 1 {
        return mutubleArray.first!
    /// Recursive case.
    } else if currentElement < mutubleArray[1] {
        mutubleArray.removeFirst()
        currentElement = maxElement(of: mutubleArray)!
    /// Recursive case.
    } else {
        mutubleArray.remove(at: 1)
        currentElement = maxElement(of: mutubleArray)!
    }
    
    return currentElement
}

summarize(arrayOne)
count(of: arrayOne)
maxElement(of: arrayOne)
