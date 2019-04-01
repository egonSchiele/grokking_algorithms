using Test
using Suppressor

function countdown(i)
    println(i)
    if i <= 0
        return
    end
    countdown(i-1)
end

result = @capture_out(countdown(10)) # return stdout result
@test result == "10
9
8
7
6
5
4
3
2
1
0
"
