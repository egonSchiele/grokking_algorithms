using Test

function binary_search(arr,item)
    low = 0
    high = length(arr)

    while low <= high
        mid = (low + high) ÷ 2
        guess = 0
        try
            guess = arr[mid]
        catch
            return nothing
        end
        if guess == item
            return mid
        elseif guess > item
            high = mid - 1
        else
            low = mid + 1
        end
    end
end

arr = [1,3,5,7,9]
@test binary_search(arr,3) == 2
@test binary_search(arr,-1) == nothing
