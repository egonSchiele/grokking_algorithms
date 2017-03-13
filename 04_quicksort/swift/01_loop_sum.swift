import Foundation

func sum (_ arr: [Int]) -> Int {
    var total = 0
    for x in arr {
        total += x
    }
    return total
}

print(sum([1, 2, 3, 4])) // => 10
