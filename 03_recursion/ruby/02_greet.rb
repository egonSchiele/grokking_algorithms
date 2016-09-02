def greet2(name)
  puts "how are you, #{name}?"
end

def bye
  print "ok bye!"
end

def greet(name)
  puts "hello, #{name}!"
  greet2(name)
  puts "getting ready to say bye..."
  bye
end

greet("adit")
