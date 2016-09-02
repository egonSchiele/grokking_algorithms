def count(list)
  return 0 if list.empty?
  1 + count(list[1..-1])
end
