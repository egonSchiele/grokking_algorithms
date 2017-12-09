object Max {
  def main(args: Array[String]): Unit = {
    def max(list: List[Int]): Unit = {
      // if the list contains two items, print the larger one
      if (list.length == 2) if(list(0) > list(1)) println(list(0)) else println(list(1))
      // if the list cntains one item, print it
      else if (list.length == 1) println(list(0))
      // tell user if the list is empty
      else if (list.isEmpty) println("List is empty")
      // if the head of the list > next item, recurse with a list containing the head and the items other than the second
      else if (list.head > list.tail(0)) max(list.head :: list.tail.slice(1, list.length))
      // else recurse with the tail of the list
      else max(list.tail)
    }
     max(List())
     max(List(4))
     max(List(1, 10, -4, 5))
  }
}
