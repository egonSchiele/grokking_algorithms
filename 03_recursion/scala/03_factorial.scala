def fact(x: Int): Int = {
  if(x == 1) 1
  else x * fact(x-1)
}
println(fact(5))
