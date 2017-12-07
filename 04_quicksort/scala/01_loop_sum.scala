object Sum {
  def main(args: Array[String]): Unit = {
    def sum(arr: List[Int], total: Int = 0): Int = {
      // if the list is not empty, call recursively on the list's tail with the sum of the accumulated value and list's head
      if (!arr.isEmpty) sum(arr.tail, total + arr.head)
      // otherwise, return the accumulated value
      else total
    }
    println(sum(List(1, 2, 3, 4)))
  }
}
