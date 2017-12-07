object Sum {
  def main(args: Array[String]): Unit = {
    def sum(arr: List[Int]): Int = {
      var total: Int = 0
      for (x <- arr) total += x
      total
    }
    println(sum(List(1, 2, 3, 4)))
  }
}
