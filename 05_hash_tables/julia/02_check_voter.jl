function check_vote(name)
	if voted.get(name)
		println("kick them out!")
	else
		voted[name] = true
		println("let them vote!")
	end
end

voted = Dict()
check_vote("tom")
check_vote("mike")
check_vote("mike")
