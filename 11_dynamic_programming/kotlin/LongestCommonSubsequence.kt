import kotlin.math.max

fun main() {
    val wordA = "hish"
    val wordB = "fish"
    getLongestCommonSubSequence(wordA, wordB)
}

private fun getLongestCommonSubSequence(wordA: String, wordB: String) {
    val cell = Array(wordA.length) { IntArray(wordB.length) }
    for (i in wordA.indices) {
        for (j in wordB.indices) {
            // Буквы совпадают
            if (wordA[i] == wordB[j]) {
                if (i > 0 && j > 0) {
                    cell[i][j] = cell[i - 1][j - 1] + 1
                } else {
                    cell[i][j] = 1
                }
            } else {
                // Буквы не совпадают
                if (i > 0 && j > 0) {
                    cell[i][j] = max(cell[i - 1][j], cell[i][j - 1])
                } else {
                    cell[i][j] = 0
                }
            }
        }
    }
    printResult(cell)
}

fun printResult(array: Array<IntArray>) {
    for (row in array) {
        println(row.contentToString())
    }
}
