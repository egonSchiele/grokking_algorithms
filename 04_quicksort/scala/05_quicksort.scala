object quicksort {
  def main(args: Array[String]): Unit = {
    def quicksort(array: Array[Int]): Array[Int] = {
      if (array.length < 2) { //base case, arrays with 0 or 1 element are already "sorted"
        return array
      } else {
        val pivot: Int = array(0) //recursive case
        val less: Array[Int] = array.drop(1).filter(x => x < pivot) //sub-array of all the elements less than the pivot
        val greater: Array[Int] = array.drop(1).filter(x => x > pivot) //sub-array of all the elements greater than the pivot
        return (quicksort(less) :+ pivot) ++ quicksort(greater)
      }
    }
    val answer = quicksort(Array(10, 5, 2, 3))
    for (i <- answer) println(i)
  }
}
