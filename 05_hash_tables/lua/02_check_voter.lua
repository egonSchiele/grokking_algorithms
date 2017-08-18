local voted = {}
function check_voter(name)
    if voted[name] then
        print("kick them out!")
    else
        voted[name] = true
        print("let them vote!")
    end
end

check_voter("tom")
check_voter("mike")
check_voter("mike")