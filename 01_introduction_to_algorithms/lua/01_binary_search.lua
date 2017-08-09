function binary_search(array, value)
    -- Lua arrays start with 1
    local low, high = 1, #array
    
    while low <= high do
        local mid = math.floor((low + high) / 2)
        local guess = array[mid]
        
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

local my_array = {1, 3, 5, 7, 9}

print(binary_search(my_array, 3)) -- => 2
print(binary_search(my_array, -1)) -- => nil