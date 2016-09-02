def sum(arr)
  total = 0
  arr.each do |x|
    total += x
  end

  total
end

puts sum([1, 2, 3, 4])
