def max(list)
  if list.empty?
    nil
  elsif list.length == 1
    numbers[0]
  else
    sub_max = max(list[1..-1])
    list[0] > sub_max ? list[0] : sub_max
  end
end
