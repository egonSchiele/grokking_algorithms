def sum(list: List[Int]): Int = {
  if(list.isEmpty) return 0
  else return list(0) + sum(list.drop(1))
}