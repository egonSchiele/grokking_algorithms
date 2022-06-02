import Foundation

if wordA[i] == wordB[j] {
    // The letters match
    cell[i][j] = cell[i-1][j-1] + 1
} else {
    // The letters don't match.
    cell[i][j] = max(cell[i-1][j], cell[i][j-1])
}

/* Working example for "play" with

var wordA = "fish"
var wordB = "hish"
var cell : [[Int]] = Array(repeating: Array(repeating: 0, count: wordA.characters.count), count: wordB.characters.count)
let wordAArray = wordA.characters.map { String($0) }
let wordBArray = wordB.characters.map { String($0) }

for i in 0...wordA.characters.count-1 {
    for j in 0...wordB.characters.count-1 {
        // The letters match
        if wordAArray[i] == wordBArray[j] {
            if i > 0 && j > 0 {
                cell[i][j] = cell[i-1][j-1] + 1
            } else {
                cell[i][j] =  1
            }
        } else {
            // The letters don't match.
            if i > 0 && j > 0 {
                cell[i][j] = max(cell[i-1][j], cell[i][j-1])
            } else {
               cell[i][j] = 0
            }
        }
    }
}

*/


// MARK: - Another implementation:
//Method for getting long subsequence:
func getLongSubsequence(in word1: String, and word2: String) -> Int {
    ///Checking input's words for empty and equatable.
    guard !word1.isEmpty, !word2.isEmpty, word1.count == word2.count else { return 0 }
    ///Creating table.
    var table = Array(repeating: Array(repeating: 0, count: word1.count), count: word2.count)
    ///Loop in order to find the actual subsequence.
    word1.enumerated().forEach { index1, char1 in
        word2.enumerated().forEach { index2, char2 in
            ///If characters are equal.
            if char1 == char2 {
                guard index1 != 0, index2 != 0 else { return table[index1][index2] = 1 }
                table[index1][index2] = table[index1 - 1][index2 - 1] + 1
            ///If characters aren't equal.
            } else {
                let actualIndex1 = index1 == 0 ? index1 : index1 - 1
                let actualIndex2 = index2 == 0 ? index2 : index2 - 1
                table[index1][index2] = max(table[actualIndex1][index2], table[index1][actualIndex2])
            }
        }
    }
    
    print("getLongSequence", table)
    return table.last?.max() ?? 0
}

//Method for getting long substring:
func getLongSubstring(in word1: String, and word2: String) -> Int {
    ///Checking input's words for empty and equatable.
    guard !word1.isEmpty, !word2.isEmpty, word1.count == word2.count else { return 0 }
    ///Creating table.
    var table = Array(repeating: Array(repeating: 0, count: word1.count), count: word2.count)
    ///Loop in order to find the actual subsequence.
    zip(Array(word1), Array(word2)).enumerated().forEach { index, elements in
        ///If characters are equal.
        if elements.0 == elements.1 {
            guard index != 0 else { return table[index][index] = 1 }
            table[index][index] = table[index - 1][index - 1] + 1
        ///If characters aren't equal.
        } else {
            guard index != 0 else { return }
            table[index - 1][index - 1] = 0
            table[index][index] = 0
        }
    }
    
    print("getLongSubstring", table)
    return table.last?.max() ?? 0
}

getLongSubsequence(in: "fish", and: "fosh") // => Result is 3.  [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 2, 2], [1, 1, 2, 3]]
getLongSubstring(in: "fish", and: "hish") // => Result is 3.  [[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 2, 0], [0, 0, 0, 3]]
