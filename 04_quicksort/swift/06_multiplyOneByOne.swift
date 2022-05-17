import Foundation

let arrayFive = [2, 3, 4] // 18 - 27 - 36

// MARK: -  Implementation:
@discardableResult func multipleOneByOne<T: Numeric>(_ array: [T], actualIndex: Int = 0) -> T {
    /// Array's checking on the empty.
    /// Base case.
    guard !array.isEmpty, array.count != actualIndex else { return 0 }
    var total: T = 0
    
    /// Recursive case.
    array.forEach {
        total += $0 * array[actualIndex]
    }
        
    return total + multipleOneByOne(array, actualIndex: actualIndex + 1)
}

multipleOneByOne(arrayFive) // Result => 81
