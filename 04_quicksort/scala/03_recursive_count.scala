def count(list: List[Int]): Int = {
  if(list.isEmpty) return 0 
  return 1 + count(list.drop(1))
}