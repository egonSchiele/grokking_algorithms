function count(array)
    if next(array) == nil then
        return 0
    end
    
    return 1 + count(table.move(array, 2, #array, 1, {}))
end

print(count({1, 2, 3, 4})) -- => 4