object Count {
  def main(args: Array[String]): Unit = {
    def count(list: List[Int]): Int = {
      if (list.isEmpty) return 0
      return 1 + count(list.drop(1))
    }
    println(count(List(1, 4, 7, 8)))
  }
}
