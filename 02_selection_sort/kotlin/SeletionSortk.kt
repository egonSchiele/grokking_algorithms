
fun ArrayList<Int>.selectionSort(): ArrayList<Int> {
    val sortedArray = arrayListOf<Int>()
    for (i in 0 until size) {
        val smallest = getSmallest()
        sortedArray += this[smallest]
        removeAt(smallest)
    }
    return sortedArray
}

fun ArrayList<Int>.getSmallest(): Int {
    var smallest = this[0]
    var index = 0
    for (i in 1 until size) if (this[i] < smallest) {
        smallest = this[i]
        index = i
    }
    return index
}


fun main(args: Array<String>) {
    val array = arrayListOf(0, 2, 5, 1, 8, 23, 31, 21, 93, 213, 31, 11, 1512, 231, 341, 516, 132, 322, 421, 643)
    print("sort: ${array.selectionSort()}")
}
