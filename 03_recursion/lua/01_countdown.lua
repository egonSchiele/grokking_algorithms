function countdown(i)
    print(i)
    -- base case
    if i <= 0 then
        return
    -- recursive case
    else
        countdown(i - 1)
    end
end

countdown(5)