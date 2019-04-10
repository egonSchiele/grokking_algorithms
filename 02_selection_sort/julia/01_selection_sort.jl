using Test

function find_smallest(arr)
    smallest = arr[1]
    smallest_index = 1
    for i = 1:length(arr)
        if arr[i] < smallest
            smallest = arr[i]
            smallest_index = i
        end
    end
    return smallest_index
end

function selection_sort(arr)
    new_arr = Array{Int64}(undef,0)
    for i = 1:length(arr)
        smallest = find_smallest(arr)
        append!(new_arr,arr[smallest])
        deleteat!(arr,smallest)
    end
    return new_arr
end

arr = [5,3,6,2,10]
@test selection_sort(arr) == [2,3,5,6,10]
