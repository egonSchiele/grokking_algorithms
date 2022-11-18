import Foundation

// Finds the smallest value in an array
func findSmallestIndex <T: Comparable> (_ arr: [T]) -> Int {
    // Stores the smallest value
    var smallest = arr[0]
    // Stores the index of the smallest value
    var smallestIndex = 0
    for i in 1..<arr.count {
        if arr[i] < smallest {
            smallest = arr[i]
            smallestIndex = i
        }
    }
    return smallestIndex
}

// Sort array
func selectionSort <T: Comparable> (arr: [T]) -> [T] {
    // We don't need any calculation if the array length is 1
    guard arr.count > 1 else { return arr }
    
    var newArr: [T] = []
    
    // We have to make mutableArray reference copy of original array, because Swift 3 doesn't allow to get var parameter
    var mutableArr = arr
    for _ in 0..<mutableArr.count {
       //Finds the smallest element in the array and adds it to the new array
        let smallestIndex = findSmallestIndex(mutableArr)
        newArr.append(mutableArr.remove(at: smallestIndex))
    }
    return newArr
}

print(selectionSort(arr: [5, 3, 6, 2, 10])) // => [2, 3, 5, 6, 10]


