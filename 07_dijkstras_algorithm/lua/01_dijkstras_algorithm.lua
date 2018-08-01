-- the graph
local graph = {}
graph["start"] = {}
graph["start"]["a"] = 6
graph["start"]["b"] = 2

graph["a"] = {}
graph["a"]["fin"] = 1

graph["b"] = {}
graph["b"]["a"] = 3
graph["b"]["fin"] = 5

graph["fin"] = {}

-- the costs table
local infinity = math.huge
local costs = {}
costs["a"] = 6
costs["b"] = 2
costs["fin"] = infinity

-- the parents table
local parents = {}
parents["a"] = "start"
parents["b"] = "start"
parents["fin"] = nil

local processed = {}

local function find_lowest_cost_node(costs)
    local lowest_cost = math.huge
    local lowest_cost_node = nil
    -- Go through each node.
    for node, cost in pairs(costs) do
        -- If it's the lowest cost so far and hasn't been processed yet...
        if cost < lowest_cost and not processed[node] then
            -- ... set it as the new lowest-cost node.
            lowest_cost = cost
            lowest_cost_node = node
        end
    end
    return lowest_cost_node
end

-- Find the lowest-cost node that you haven't processed yet.
local node = find_lowest_cost_node(costs)
-- If you've processed all the nodes, this while loop is done.
while node ~= nil do
    local cost = costs[node]
    -- Go through all the neighbors of this node.
    local neighbors = graph[node]
    for n, n_cost in pairs(neighbors) do
        local new_cost = cost + n_cost
        -- If it's cheaper to get to this neighbor by going through this node...
        if costs[n] > new_cost then
            -- ... update the cost for this node.
            costs[n] = new_cost
            -- This node becomes the new parent for this neighbor.
            parents[n] = node
        end
    end
    -- Mark the node as processed.
    processed[node] = true
    -- Find the next node to process, and loop.
    node = find_lowest_cost_node(costs)
end

print("Cost from the start to each node:")
for key, value in pairs(costs) do
    print(key .. ": " .. value)
end