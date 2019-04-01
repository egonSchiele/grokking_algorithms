using Test

function max_(arr)
    if length(arr) == 1
        return arr[1]
    end
    sub_max = max_(arr[2:end])
    return arr[1] > sub_max ? arr[1] : sub_max
end

@test max_([1,5,8,20,9,10]) == 20
