private fun sum(arr: Array<Int>): Int {
    var total = 0
    for (x in arr) total += x
    return total
}

fun main(args: Array<String>) = println(sum(arrayOf(1, 2, 3, 4)))