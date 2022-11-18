using Test

function quick_sort(arr)
    if length(arr) < 2 return arr end
    pivot = arr[1]
    less = [i for i in arr[2:end] if i <= pivot]
    greater = [i for i in arr[2:end] if i > pivot]
    return vcat(quick_sort(less), [pivot], quick_sort(greater))
end

@test quick_sort([3,5,2,1,4]) == [1,2,3,4,5]
