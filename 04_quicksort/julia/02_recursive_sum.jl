using Test

function sum(arr)
    if isempty(arr)
        return 0
    end
    return arr[1] + sum(arr[2:end])
end

@test sum([1,2,3,4]) == 10
