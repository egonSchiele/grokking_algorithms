def max(list)
  return nil if list.empty?

  if list.length == 1
    list[0] # base case
  else
    sub_max = max(list[1..-1])
    list[0] > sub_max ? list[0] : sub_max
  end
end

puts max([2,3,8,5,5])
