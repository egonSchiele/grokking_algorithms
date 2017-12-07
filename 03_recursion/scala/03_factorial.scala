object Factorial {
  def main(args: Array[String]): Unit = {
    def fact(x: Int, acc: Int = 1): Int = {  // set accumulator parameter with default start value
      if (x == 1) acc  // return accumulated value when one is reached
      else fact(x - 1, acc * x)  // recursive call with next number and updated acc value
    }
    println(fact(5))
  }
}
