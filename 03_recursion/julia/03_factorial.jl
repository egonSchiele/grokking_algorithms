using Test

function factorial(x)
    if x == 1
        return 1
    end
    return x * factorial(x-1)
end

@test factorial(5) == 120
