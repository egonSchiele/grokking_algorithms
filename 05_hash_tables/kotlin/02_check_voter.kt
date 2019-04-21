private val voted = hashMapOf<String, Boolean>()

private fun checkVoter(name: String) {
    println(
        if (voted.containsKey(name)) {
            "kick them out!"
        } else {
            voted[name] = true
            "let them vote!"
        }
    )
}

fun main(args: Array<String>) {
    checkVoter("tom")   // let them vote!
    checkVoter("mike")  // let them vote!
    checkVoter("mike")  // kick them out!
}