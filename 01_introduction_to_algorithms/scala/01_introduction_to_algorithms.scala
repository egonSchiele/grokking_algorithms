object BinarySearch {
  // Iterative binary search
  def searchIterative(list: Array[Int], item: Int): Option[Int] = {
    // low and high keep track of which part of the list you'll search in.
    var low = 0
    var high = list.length - 1

    // While you haven't narrowed it down to one element ...
    while(low <= high) {
      // ... check the middle element
      val mid = (low + high) / 2
      val guess = list(mid)
      // Found the item.
      if(guess == item) return Some(mid)
      // The guess was too high.
      if(guess > item) {
        high = mid - 1
      } else {
        // The guess was too low.
        low = mid + 1
      }
    }
    // Item doesn't exist
    None
  }

  // Recursive binary search
  def searchRecursive(list: Array[Int], low: Int, high: Int, item: Int): Option[Int] = {
    // Check base case
    if(high >= low) {
      val mid = (high + low) / 2
      val guess = list(mid)

      // If element is present at the middle itself
      if(guess == item) return Some(mid)

      // If element is smaller than mid, then it can only
      // be present in left subarray
      if(guess > item) {
        return searchRecursive(list, low, mid - 1, item)
      }
      // Else the element can only be present in right subarray
      else {
        return searchRecursive(list, mid + 1, high, item)
      }
    }
    // Element is not present in the array
    None
  }
}

// We must initialize the object to use the methods
val bs = BinarySearch
val myList = Array(1, 3, 5, 7, 9)

println(bs.searchIterative(myList, 3)) // => Some(1)
// 'None' means nil in Scala. We use to indicate that the item wasn't found.
println(bs.searchIterative(myList, -1)) // => None
