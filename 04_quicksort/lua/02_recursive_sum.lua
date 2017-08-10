function sum(array)
    if next(array) == nil then
        return 0;
    end
    
    return array[1] + sum(table.move(array, 2, #array, 1, {}))
end

print(sum({1, 2, 3, 4})) -- => 10