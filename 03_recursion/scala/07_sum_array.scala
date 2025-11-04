def sumArray(arr: List[Int]): Int = {
  if(arr.isEmpty) 0
  else arr.head + sumArray(arr.tail)
}

