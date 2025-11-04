def count(arr: List[Int]): Int = {
  if(arr.isEmpty) 0
  else 1 + count(arr.tail)
}

