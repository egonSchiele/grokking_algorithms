object checkVoter {
  def main(args: Array[String]): Unit = {
    import scala.collection.mutable
    val voted = mutable.Map[String, Boolean]()
    def check_voter(name: String): Unit = {
      if (voted.exists(_ == (name, true))) {
        println("kick them out!")
      } else {
        voted += (name -> true)
        println("let them vote!")
      }
    }
    check_voter("tom")
    check_voter("mike")
    check_voter("mike")
  }
}
