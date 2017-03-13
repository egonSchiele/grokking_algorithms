import Foundation

// Note: If you aren’t familiar with Comparable, please check out “Generics” chapter in Swift book
func binarySearch <T: Comparable>(_ list: [T], item: T) -> Int? {
    // low and high keep track of which part of the list you'll search in.
    var low = 0
    var high = list.count - 1
    // While you haven't narrowed it down to one element ...
    while low <= high {
        //... check the middle element
        let mid = low + (high - low) / 2
        let guess = list[mid]
        // Found the item.
        if guess == item {
            return mid
        }
        // The guess was too high.
        if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return nil
}

let myList = [1, 3, 5, 7, 9]
print(binarySearch(myList, item: 3) ?? "Not Found") // => 1
print(binarySearch(myList, item: -1) ?? "Not Found") // => Not Found

