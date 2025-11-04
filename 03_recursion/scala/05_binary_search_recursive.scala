def binarySearch(arr: Array[Int], target: Int): Option[Int] = {
  if(arr.isEmpty) return None
  
  val mid = arr.length / 2
  
  if(arr(mid) == target) Some(mid)
  else if(arr(mid) > target) binarySearch(arr.slice(0, mid), target)
  else {
    val recursiveResponse = binarySearch(arr.slice(mid + 1, arr.length), target)
    recursiveResponse match {
      case Some(idx) => Some(mid + 1 + idx)
      case None => None
    }
  }
}

println(binarySearch(Array(6, 7, 8, 9, 10), 8))
println(binarySearch(Array(6, 7, 8, 9, 10), 6))

