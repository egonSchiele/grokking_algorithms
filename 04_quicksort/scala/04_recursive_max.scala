def max(list: List[Int]): Int = {
  if(list.length == 2){
    if(list(0) > list(1)) return list(0) 
    else return list(1)
  }
  val sub_max = max(list.drop(1))
  if(list(0) > sub_max) list(0) 
  else sub_max
}