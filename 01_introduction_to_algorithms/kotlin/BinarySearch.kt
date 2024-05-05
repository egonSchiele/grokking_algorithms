fun List<Int>.binarySearch(item: Int): Int? {
    var min = 0
    var max = lastIndex
    while (min <= max) {
        val mid = (min + max) / 2
        val guess = this[mid]
        when {
            guess == item -> return mid
            guess > item -> max = mid - 1
            else -> min = mid + 1
        }
    }
    return null
}


val sortedArray = (0..100 step 3).toList()


fun main(args: Array<String>) {
    print(sortedArray.binarySearch(6))
}
