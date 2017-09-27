//Finds the smallest value in an array
def findSmallest(arr: Array[Int]): Int = {
  //Stores the smallest value
  var smallest = arr(0)
  for(i <- 1 until arr.length){
    if(arr(i) < smallest) {
      smallest = arr(i)
    }
  }
  return smallest
}

//Sort array
def selectionSort(arr: Array[Int]): Array[Int] = {
  val newArr = new Array[Int](arr.length)
  for(i <- 0 until arr.length){
    //Finds the smallest element in the array and adds it to the new array
    val smallest = findSmallest(arr)
    newArr(i) = smallest
    //Sets current smallest value in array above largest value to avoid reusing values
    arr(arr.indexOf(smallest)) = arr.max + 1
  }
  return newArr
}
selectionSort(Array(5, 3, 6, 2, 10))
