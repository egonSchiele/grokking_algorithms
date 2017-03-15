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

