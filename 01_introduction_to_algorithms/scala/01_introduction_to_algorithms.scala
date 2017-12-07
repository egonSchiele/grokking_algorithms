object binarySearch {
  def main(args: Array[String]): Unit = {
    def binarySearch(list: List[Int], item: Int): Unit = {
      if (list.isEmpty) println("Item not found")
      else {
        val guess = list(list.length / 2)
        if (item == guess) println(guess)
        else if (item < guess) {
          val halfList = list.take(list.length / 2)
          binarySearch(halfList, item)
        } else {
          val halfList = list.drop(1 + (list.length / 2))
          binarySearch(halfList, item)
        }
      }
    }
    val myList = List(1, 3, 5, 7, 9)
    binarySearch(myList, 3)
    binarySearch(myList, -1)
  }
}
