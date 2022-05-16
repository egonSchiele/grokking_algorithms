import Foundation

//The following implementation of quick sort is little more classic than described in the book, but we have two use this one because of some “slice” feature limitation with array on Swift 3. Main concept is the same
func quicksort <T : Comparable> (_ array : [T]) -> [T] {
    if (array.count < 2) {
        // base case, arrays with 0 or 1 element are already "sorted"
        return array
    } else {
        // recursive case
        let pivot = array[0]
        // sub-array of all the elements less than the pivot
        let less = array.filter { $0 < pivot }
        // sub-array of all the elements equal to the pivot
        let equal = array.filter { $0 == pivot }
        // sub-array of all the elements greater than the pivot
        let greater = array.filter { $0 > pivot }
        return quicksort(less) + equal + quicksort(greater)
    }
}

print(quicksort([1, 5, 10, 25, 16, 1])) // => [1, 1, 5, 10, 16, 25]


// MARK: - Another implementation:
let arrayOne = [1, 4, 2, 1, 10, 0]

// Quick sort method:
func quickSort<T: Numeric & Comparable>(_ array: [T]) -> [T] {
    /// Base case.
    guard array.count > 1 else { return array }
    /// We use unwrap for 'firstElement' because we have the element absolutely.
    let firstElement = array.first!
    var lessElements: [T] = []
    var greaterElements: [T] = []
    
    /// Recursive case.
    array.enumerated().forEach {
        /// We skip the first index as we already have firstElement.
        guard $0.offset > 0 else { return }
        firstElement >= $0.element ? lessElements.append($0.element) : greaterElements.append($0.element)
    }
    
    return quickSort(lessElements) + [firstElement] + quickSort(greaterElements)
}

quickSort(arrayOne) // Result => [0, 1, 1, 2, 4, 10]

// Quick sort method by making use of binary search:
func binaryQuickSort<T: Numeric & Comparable>(_ array: [T]) -> [T] {
    /// Base case.
    guard array.count > 1 else { return array }
    /// We must sort array for binary search.
    let sortedArray = array.sorted(by: <)
    
    /// Recursive case.
    let midIndex = (sortedArray.count - 1) / 2
    var lessElements: [T] = []
    var greaterElements: [T] = []
    
    sortedArray.enumerated().forEach {
        guard $0.offset != midIndex else { return }
        $0.offset < midIndex ? lessElements.append($0.element) : greaterElements.append($0.element)
    }
    
    return binaryQuickSort(lessElements) + [sortedArray[midIndex]] + quickSort(greaterElements)
}

binaryQuickSort(arrayOne) // Result => [0, 1, 1, 2, 4, 10]
