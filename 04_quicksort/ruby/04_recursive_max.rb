def max(list)
  if list.length == 2
    # condition ? then : else
    list[0] > list[1] ? list[0] : list[1]
  else
    sub_max = max(list[1..-1])
    list[0] > sub_max ? list[0] : sub_max
  end
end
