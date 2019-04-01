using Test
using Suppressor

function greet2(name)
    println("how are you, ",name,"?")
end

function bye()
    println("ok bye!")
end

function greet(name)
    println("hello, ",name,"!")
    greet2(name)
    println("getting ready to say bye...")
    bye()
end

result = @capture_out greet("adit")
@test result == "hello, adit!
how are you, adit?
getting ready to say bye...
ok bye!
"
