def count(list):
  if list == []:
    return 0
  return 1 + count(list[1:])
