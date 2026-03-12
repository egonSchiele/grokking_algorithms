import Foundation

//Worst case performance: O(n^2) when the smallest or largest element is always chosen as the pivot. This can happen when the input array is already sorted or reverse sorted.
func quicksort_worst <T : Comparable> (_ array : [T]) -> [T] {
    // base case, arrays with 0 or 1 element are already "sorted"
    guard array.count > 1 else { return array }
    // recursive case - 0th element for worst case
    let pivot = array[0]
    // sub-array of all the elements less than the pivot
    let less = array.filter { $0 < pivot }
    // sub-array of all the elements equal to the pivot
    let equal = array.filter { $0 == pivot }
    // sub-array of all the elements greater than the pivot
    let greater = array.filter { $0 > pivot }
    return quicksort_worst(less) + equal + quicksort_worst(greater)
}

print(quicksort_worst([1, 5, 10, 25, 16, 1])) // => [1, 1, 5, 10, 16, 25]

//Best case performance: O(n log n) when the pivot divides the array into two equal
func quicksort_best <T : Comparable> (_ array : [T]) -> [T] {
    // base case, arrays with 0 or 1 element are already "sorted"
    guard array.count > 1 else { return array }
    // recursive case - random element for best case
    let pivot = array[Int.random(in: 0 ..< array.count)]
    // sub-array of all the elements less than the pivot
    let less = array.filter { $0 < pivot }
    // sub-array of all the elements equal to the pivot
    let equal = array.filter { $0 == pivot }
    // sub-array of all the elements greater than the pivot
    let greater = array.filter { $0 > pivot }
    return quicksort_best(less) + equal + quicksort_best(greater)
}

print(quicksort_best([1, 5, 10, 25, 16, 1])) // => [1, 1, 5, 10, 16, 25]
