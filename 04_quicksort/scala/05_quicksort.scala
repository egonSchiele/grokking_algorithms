def quicksort(array: Array[Int]): Array[Int] = {
  if(array.length < 2){
    //base case, arrays with 0 or 1 element are already "sorted"
    return array
  }
  else {
    //recursive case
    val pivot: Int = array(0)
    //sub-array of all the elements less than the pivot
    val less: Array[Int] = array.drop(1).filter(x => x < pivot)
    //sub-array of all the elements greater than the pivot
    val greater: Array[Int] = array.drop(1).filter(x => x > pivot)
    return (quicksort(less) :+ pivot) ++ quicksort(greater)
  }
}
quicksort(Array(10,5,2,3))