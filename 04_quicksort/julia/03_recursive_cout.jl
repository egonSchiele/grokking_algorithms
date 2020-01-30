using Test

function count(arr)
    if isempty(arr)
        return 0
    end
    return 1 + count(arr[2:end])
end

@test count([1,2,3,4]) == 4
