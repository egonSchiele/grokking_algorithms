def findMax(arr: Array[Int]): Int = {
  if(arr.length == 0) 0
  else if(arr.length == 1) arr(0)
  else if(arr.length == 2) if(arr(0) > arr(1)) arr(0) else arr(1)
  else {
    val subMax = findMax(arr.tail)
    if(arr(0) > subMax) arr(0) else subMax
  }
}

