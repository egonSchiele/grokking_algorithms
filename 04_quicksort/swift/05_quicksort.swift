import Foundation

//The following implementation of quick sort is little more classic than described in the book, but we have two use this one because of some “slice” feature limitation with array on Swift 3. Main concept is the same
func quicksort <T : Comparable> (_ array : [T]) -> [T] {
    // base case, arrays with 0 or 1 element are already "sorted"
    guard array.count > 1 else { return array }
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

print(quicksort([1, 5, 10, 25, 16, 1])) // => [1, 1, 5, 10, 16, 25]
