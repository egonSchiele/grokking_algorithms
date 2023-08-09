private fun max(list: IntArray): Int = when (list.size) {
    2 -> if (list[0] > list[1]) list[0] else list[1]
    else -> {
        val subMax = max(list.copyOfRange(1, list.size))
        if (list[0] > subMax) list[0] else subMax
    }
}

fun main(args: Array<String>) = println(max(intArrayOf(1, 5, 10, 25, 16, 1))) // 25
