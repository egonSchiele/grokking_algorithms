private fun fact(x: Int): Int = when (x) {
    1 -> 1
    else -> x * fact(x - 1)
}

fun main(args: Array<String>) = println(fact(5))