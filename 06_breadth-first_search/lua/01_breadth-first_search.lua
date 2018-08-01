-- Custom deque module
require "deque"

local function person_is_seller(name)
    return string.char(string.byte(name, -1)) == "m"
end

local graph = {}
graph["you"] = {"alice", "bob", "claire"}
graph["bob"] = {"anuj", "peggy"}
graph["alice"] = {"peggy"}
graph["claire"] = {"thom", "jonny"}
graph["anuj"] = {}
graph["peggy"] = {}
graph["thom"] = {}
graph["jonny"] = {}

local function search(name)
    local search_queue = deque:new()
    for _, value in pairs(graph[name]) do
        search_queue:push_right(value)
    end
    -- This array is how you keep track of which people you've searched before.
    local searched = {}
    while search_queue:len() > 0 do
        local person = search_queue:pop_left()
        -- Only search this person if you haven't already searched them.
        if not searched[person] then
            if person_is_seller(person) then
                print(person .. " is a mango seller!")
                return true
            else
                for _, value in pairs(graph[person]) do
                    search_queue:push_right(value)
                end
                -- Marks this person as searched
                searched[person] = true
            end
        end
    end
    return false
end

search("you")