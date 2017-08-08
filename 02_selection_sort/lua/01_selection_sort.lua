-- Finds the smallest value in an array
function find_smallest(array)
    -- Stores the smallest value
    local smallest = array[1]
    -- Stores the index of the smallest value
    local smallest_index = 1
    
    for i = 2, #array do
        if (array[i] < smallest) then
            smallest = array[i]
            smallest_index = i
        end
    end
    
    return smallest_index
end

-- Sort array
function selection_sort(array)
    local new_array = {}
    
    for i = 1, #array do
        -- Finds the smallest element in the array and adds it to the new array
        local smallest_index = find_smallest(array)
        new_array[i] = table.remove(array, smallest_index)
    end
    
    return new_array
end

print(table.concat(selection_sort({5, 3, 6, 2, 10}), ", "))