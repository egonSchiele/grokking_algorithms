def countdown(i)
  puts i
  # base case
  if i <= 0
    return
  # recursive case
  else
    countdown(i - 1)
  end
end

countdown(5)
