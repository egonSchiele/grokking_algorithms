def binary_search(list, item, low = 0, high = list.length - 1)
  while low <= high
    mid = (low + high) / 2
    guess = list[mid]

    if guess == item
      return mid
    elsif guess > item
      high = mid - 1
      binary_search(list, item, low, high)
    else
      low = mid + 1
      binary_search(list, item, low, high)
    end
  end

  # If item is not found
  return nil
end

# Create array with numbers 1 through 100
my_list = (1..100).to_a

puts binary_search(my_list, 2) # => 1
puts binary_search(my_list, 50) # => 49
p binary_search(my_list, 101) # => nil
