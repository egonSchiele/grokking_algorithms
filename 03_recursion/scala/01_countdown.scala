def countdown(i: Int): Int = {
  println(i)
  //base case
  if(i <= 0) return i
  //recursive case
  else countdown(i-1)
}
countdown(5)
