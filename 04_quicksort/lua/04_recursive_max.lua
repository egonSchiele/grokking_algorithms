function max(array)
    if next(array) == nil then
        return nil
    elseif #array == 1 then
        return array[1]
    elseif #array == 2 then
        return array[1] > array[2] and array[1] or array[2]
    end
    
    local sub_max = max(table.move(array, 2, #array, 1, {}))
    return array[1] > sub_max and array[1] or sub_max
end

print(max({1, 2, 3, 4})) -- => 4