val dpTableBlue = Array("b", "l", "u", "e")
val dpTableClues = Array("c", "l", "u", "e", "s")

// Create a 2D array initialized with zeros
val dpTable = Array.ofDim[Int](dpTableBlue.length, dpTableClues.length)

// for each row
for(i <- 0 until dpTableBlue.length) {
  // for each column
  for(j <- 0 until dpTableClues.length) {
    if(dpTableClues(j) == dpTableBlue(i)) {
      val prevVal = if(i > 0 && j > 0) dpTable(i-1)(j-1) else 0
      dpTable(i)(j) = prevVal + 1
    } else {
      dpTable(i)(j) = 0
    }
  }
}

// Display table
for(row <- dpTable) {
  println(row.mkString(" "))
}

