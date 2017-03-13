import Foundation

func count(list : [Int]) -> Int {
    if list.count == 0 {
        return 0
    }
    var tempArray = list
    tempArray.remove(at: 0)
    return 1 + count(list: tempArray)
}

print(count(list: [1, 2, 3, 4])) // => 4
