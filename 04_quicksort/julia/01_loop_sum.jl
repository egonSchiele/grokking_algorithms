using Test

function sum(arr)
    total = 0
    for x in arr
        total += x
    end
    return total
end

@test sum([1,2,3,4]) == 10
