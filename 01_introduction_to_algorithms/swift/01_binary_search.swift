import Foundation

let arrayOne = [16, 2, 512, 64, 1, 32, 8, 128, 256, 4]
let arrayTwo = [10, 1, 3, 4, 5, 6, 7, 8, 9, 2]

/// Note: If you aren’t familiar with Comparable, please check out “Generics” chapter in Swift book
///
/// Method:
@discardableResult func findIndexByBinarySearch<T: Comparable>(in array: [T], item: T) -> Int? {
    // For binary search you need to make the sort every time.
    let sortedArray = array.sorted(by: <)
    
    // min and max keep track of which part of the list you'll search in.
    var minIndex = sortedArray.startIndex
    var maxIndex = sortedArray.count - 1
    
    // While you haven't narrowed it down to one element ...
    while minIndex <= maxIndex {
        //... check the middle element
        let midIndex = (minIndex + maxIndex) / 2
        
        // Found the item.
        if sortedArray[midIndex] == item {
            return midIndex
        } else if sortedArray[midIndex] > item {
            maxIndex = midIndex - 1
        } else {
            minIndex = midIndex + 1
        }
    }
    return nil
}

findIndexByBinarySearch(in: arrayOne, item: 2) // => index == 1
findIndexByBinarySearch(in: arrayTwo, item: 10) // => index == 9


/// Array's extension:
extension Array where Element: Comparable {
    func binarySearhedIndex(for item: Element) -> Int? {
        let sortedArray = sorted(by: <)
        var minIndex = startIndex
        var maxIndex = count - 1
        
        while minIndex <= maxIndex {
            let midIndex = (minIndex + maxIndex) / 2
            
            if sortedArray[midIndex] == item {
                return midIndex
            } else if sortedArray[midIndex] > item {
                maxIndex = midIndex - 1
            } else {
                minIndex = midIndex + 1
            }
        }
        return nil
    }
}

arrayTwo.binarySearhedIndex(for: 2) // => index == 1
