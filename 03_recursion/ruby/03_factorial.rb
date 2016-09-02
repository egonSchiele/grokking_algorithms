def fact(x)
  if x == 1
    1
  else
    x * fact(x - 1)
  end
end

puts fact(5)
