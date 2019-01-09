private fun countdown(i: Int) {
    println(i)
    when {
        // base case
        i <= 0 -> return
        // recursive case
        else -> countdown(i - 1)
    }
}

fun main(args: Array<String>) = countdown(5)