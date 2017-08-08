function fact(x)
    if x <= 1 then
        return 1
    else
        return x * fact(x - 1)
    end
end

print(fact(5))