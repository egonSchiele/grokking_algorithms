function concat(array1, array2)
    for _, value in pairs(array2) do
        table.insert(array1, value)
    end
    
    return array1
end

function quicksort(array)
    if #array < 2 then
        -- base case, arrays with 0 or 1 element are already "sorted"
        return array
    else
        -- recursive case
        local pivot = array[1]
        local less, greater = {}, {}

        for i = 2, #array do
            if array[i] <= pivot then
                table.insert(less, array[i])
            else
                table.insert(greater, array[i])
            end
        end
        
        return concat(quicksort(less), concat({pivot}, quicksort(greater)))
    end
end

print(table.concat(quicksort({10, 5, 2, 3}), ", "))