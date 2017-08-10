function sum(array)
    local total = 0
    
    for _, value in pairs(array) do
        total = total + value
    end
    
    return total
end

print(sum({1, 2, 3, 4})) -- => 10