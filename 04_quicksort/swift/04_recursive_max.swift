import Foundation

func max(list : [Int]) -> Int {
    if list.count == 2 {
        return (list[0] > list[1]) ? list[0] : list[1]
    } else if list.count < 2 {
        return list.first ?? 0
    }
    var tempArray = list
    tempArray.remove(at: 0)
    let subMax = max(list: tempArray)
    return (list[0] > subMax) ? list[0] : subMax
}

print(max(list: [1, 5, 10, 25, 16, 1])) // => 25
