def greet2(name: String): Unit = {
println("how are you, " + name + "?")
}

def bye(): Unit = {
  println("ok bye!")
}

def greet(name: String): Unit = {
println("hello, " + name + "!")
greet2(name)
println("getting ready to say bye...")
bye()
}

greet("adit")