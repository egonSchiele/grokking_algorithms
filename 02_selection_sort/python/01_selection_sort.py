# Finds the smallest value in an array
def findSmallest(arr):
  # Stores the smallest value
  # The function does the same thing as expression min(arr)
  smallest = arr[0]
  for i in arr[1:]:
    if smallest > i:
      smallest = i
  return smallest

# Sort array
def selectionSort(arr):
  newArr = []
  while arr:
      # Finds the smallest element in the array and adds it to the new array
      smallest = findSmallest(arr)
      newArr.append(smallest)
      arr.remove(smallest)
  return newArr

print(selectionSort([5, 3, 6, 2, 10]))
