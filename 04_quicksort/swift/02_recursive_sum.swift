import Foundation

func sum(list : [Int]) -> Int {
    if list.count == 0 {
        return 0
    }
    var tempArray = list
    tempArray.remove(at: 0)
    return list[0] + sum(list: tempArray)
}

print(sum(list: [1, 2, 3, 4])) // => 10
