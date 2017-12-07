object groceries {
  def main(args: Array[String]): Unit = {
    import scala.collection.mutable
    val book = mutable.Map[String, Double]()
    book += ("apple" -> 0.67)
    book += ("milk" -> 1.49)
    book += ("avocado" -> 1.49)
    println(book)
  }
}
