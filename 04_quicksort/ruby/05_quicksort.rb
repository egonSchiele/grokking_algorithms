def quicksort(array)
  if array.length < 2
    # base case, arrays with 0 or 1 element are already "sorted"
    array
  else
    # recursive case
    pivot = array[0]
    # sub-array of all the elements less than the pivot
    rest = array[1..-1]
    less = rest.select { |i| i <= pivot }
    # sub-array of all the elements greater than the pivot
    greater = rest.select { |i| i > pivot }

    quicksort(less) + [pivot] + quicksort(greater)
  end
end

print quicksort([10, 5, 2, 3])
