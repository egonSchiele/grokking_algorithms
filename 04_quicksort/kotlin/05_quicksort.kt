fun quickSort(list: List<Int>): List<Int> {
    // base case, arrays with 0 or 1 element are already "sorted"
    if (list.size <= 1) return list
    // recursive case
    val pivot = list[list.size / 2]
    val equal = list.filter { it == pivot }
    val less = list.filter { it < pivot }
    val greater = list.filter { it > pivot }
    return quickSort(less) + equal + quickSort(greater)
}

fun main(args: Array<String>) = println(quickSort(listOf(10, 5, 2, 3))) // [2, 3, 5, 10]
