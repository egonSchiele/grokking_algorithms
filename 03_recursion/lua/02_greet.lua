function greet2(name)
    print("how are you, " .. name .. "?")
end

function bye()
    print("ok bye!")
end

function greet(name)
    print("hello, " .. name .. "!")
    greet2(name)
    print("getting ready to say bye...")
    bye()
end

greet("adit")