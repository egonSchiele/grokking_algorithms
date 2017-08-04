function binary_search(table, value)
    -- Lua arrays start with 1
    local low, high = 1, #table
    
    while low <= high do
        local mid = math.floor((low + high) / 2)
        local guess = table[mid]
        
        if guess == value then
            return mid
        elseif guess > value then
            high = mid - 1
        else
            low = mid + 1
        end
    end
    
    return nil
end

local my_table = {1, 3, 5, 7, 9}

print(binary_search(my_table, 3)) -- => 2
print(binary_search(my_table, -1)) -- => nil