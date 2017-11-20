-- Custom set module
require "set"

-- You pass an array in, and it gets converted to a set.
local states_needed = set.new({"mt", "wa", "or", "id", "nv", "ut", "ca", "az"})

local stations = {}
stations["kone"] = set.new({"id", "nv", "ut"})
stations["ktwo"] = set.new({"wa", "id", "mt"})
stations["kthree"] = set.new({"or", "nv", "ca"})
stations["kfour"] = set.new({"nv", "ut"})
stations["kfive"] = set.new({"ca", "az"})

local final_stations = set.new()

while next(states_needed) ~= nil do
    local best_station = nil
    local states_covered = set.new()
    for station, states in pairs(stations) do
        local covered = states_needed * states
        if covered:len() > states_covered:len() then
            best_station = station
            states_covered = covered
        end
    end

    states_needed = states_needed - states_covered
    final_stations:add(best_station)
end

print(final_stations)