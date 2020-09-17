using DataStructures, Test, Suppressor

graph = Dict()
graph["you"] = ["alice","bob","claire"]
graph["bob"] = ["anuj","peggy"]
graph["claire"] = ["thom","jonny"]
graph["alice"] = ["peggy"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

function person_is_seller(name)
	return name[end] == 'm'
end

function search(name)
	search_queue = Deque{String}()
	map(n -> push!(search_queue,n),graph[name])
	searched = []
	while isempty(search_queue) == false
		person = popfirst!(search_queue)
		if (person in searched) == false
			if person_is_seller(person)
				println(person , " is a mango seller")
				return true
			else
				map(n -> push!(search_queue,n),graph[person])
				push!(searched,person)
			end
		end
	end
	return false
end


result = @capture_out search("you")
@test result == "thom is a mango seller
"
