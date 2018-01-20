def binary_search(array, item):
	# change 'list' to 'array' to be consistent with the text and avoid potential list function call error
	# low and high keep track of which part of the array you will be searching in.
	low = 0
	high = len(array) - 1

    # While you haven't narrowed it down to one element ...
	while low <= high:
		# ... check the middle element.
		# convert the mid index to integer, otherwise it will pop out an error, in Python 3
		mid = int((low + high) / 2)
		guess = array[mid]
		# Found the item.
		if guess == item:
			return mid
		# The guess was too high.
		if guess > item:
			high = mid - 1
		# The guess was too low.
		else:
			low = mid + 1
	# The item doesn't exist.
	return None

# Let's test it!
my_array = [1, 3, 5, 7, 9]

print(binary_search(my_array, 3))
# => 1
# Remember, lists(arrays) start at 0.
# The second slot has index 1.


print(binary_search(my_array, -1))
# => None
# "None" means nil in Python. It indicates that the item wasn't found.