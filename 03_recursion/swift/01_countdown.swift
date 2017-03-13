import Foundation

func countDown(i : Int) {
    print(i)
    // base case
    if i <= 0 {
        return
    } else {
        // recursive case
        countDown(i: i-1)
    }
}

countDown(i: 5)


