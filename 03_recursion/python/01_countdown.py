def countdown(i):
  print(i)
  # base case
  if i <= 0:
    return
  # recursive case
  else:
    countdown(i-1)

countdown(5)
