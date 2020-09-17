class BinarySearch():

  def search_iterative(self, list, item):
    # low and high keep track of which part of the list you'll search in.
    low = 0
    high = len(list) - 1

    # While you haven't narrowed it down to one element ...
    while low <= high:
      # ... check the middle element
      mid = (low + high) // 2
      guess = list[mid]
      # Found the item.
      if guess == item:
        return mid
      # The guess was too high.
      if guess > item:
        high = mid - 1
      # The guess was too low.
      else:
        low = mid + 1

    # Item doesn't exist
    return None

  def search_recursive(self, list, low, high, item):
    # Check base case 
    if high >= low: 
  
        mid = (high + low) // 2
        guess = list[mid]
  
        # If element is present at the middle itself 
        if guess == item:
            return mid 
  
        # If element is smaller than mid, then it can only 
        # be present in left subarray 
        elif guess > item: 
            return self.search_recursive(list, low, mid - 1, item) 
  
        # Else the element can only be present in right subarray 
        else: 
            return self.search_recursive(list, mid + 1, high, item) 
  
    else: 
        # Element is not present in the array 
        return None

if __name__ == "__main__":
  # We must initialize the class to use the methods of this class
  bs = BinarySearch()
  my_list = [1, 3, 5, 7, 9]
  
  print(bs.search_iterative(my_list, 3)) # => 1

  # 'None' means nil in Python. We use to indicate that the item wasn't found.
  print(bs.search_iterative(my_list, -1)) # => None