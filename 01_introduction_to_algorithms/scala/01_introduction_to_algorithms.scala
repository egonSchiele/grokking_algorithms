def binarySearch(numbers : Vector[Int], item : Int) : Option[Int] = {
    @tailrec
    def search(low : Int, high : Int) : Option[Int] = {
      println(s"low = $low ; high = $high")
      if (low > high) None
      else{
        val mid = (low + high)/2
        val guess = numbers(mid)
        if (guess == item) Some(mid)
        else if (guess > item) search(low, mid - 1)
        else search(mid + 1, high)
      }
    }

    search(0, numbers.length - 1)
  }
