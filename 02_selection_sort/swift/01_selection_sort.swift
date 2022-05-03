// Chapter 2
// Selection sorting:

let arrayOne = [21, 10, 41, 4, 5, 0, 100, 1]

// Find smallest element index:
@discardableResult func smallestElementIndex<T: Comparable>(in array: [T]) -> Int? {
    /// Checking array. It's empty or not.
    guard !array.isEmpty, var smallestElement = array.first else { return nil }
    
    /// We might loop elements and then find smallest element.
    array.forEach {
        guard smallestElement >= $0 else { return }
        smallestElement = $0
    }
    
    /// We might find smallest element also by that way.
    /// P.S We use unwrap because we know exactly we have not empty array.
//    smallestElement = array.sorted(by: <).first!
    
    /// By making use of native method as 'firstIndex' we can get needed index.
    return array.firstIndex(of: smallestElement)
}

smallestElementIndex(in: arrayOne) // => The result index will be '5'

// Select sort from lowest to highest elements:
@discardableResult func selectionSortByMin<T: Comparable>(in array: [T]) -> [T]? {
    /// Checking array. It's empty or not.
    guard !array.isEmpty else { return nil }
    
    /// Create 'mutableArray' for the mutable state of array from parameters.
    var mutableArray = array
    /// Create 'sortedArray' for the sorted elements
    var sortedArray: [T] = []
    
    /// Make loop for the getting new 'sortedArray'
    array.forEach { _ in
        guard let smallestElementIndex = smallestElementIndex(in: mutableArray) else { return }
        sortedArray.append(mutableArray[smallestElementIndex])
        mutableArray.remove(at: smallestElementIndex)
    }
        
    return sortedArray
}

selectionSortByMin(in: arrayOne) // => The result will be [0, 1, 4, 5, 10, 21, 41, 100]
