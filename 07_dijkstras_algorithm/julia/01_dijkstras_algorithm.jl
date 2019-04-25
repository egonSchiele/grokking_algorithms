# Julia version: LTS (v1.0.3)

graph = Dict()
graph["start"] = Dict()
graph["start"]["a"] = 6
graph["start"]["b"] = 2

graph["a"] = Dict()
graph["a"]["fin"] = 1

graph["b"] = Dict()
graph["b"]["a"] = 3
graph["b"]["fin"] = 5

graph["fin"] = Dict()

# the costs table
infinity = Inf
costs = Dict()
costs["a"] = 6
costs["b"] = 2
costs["fin"] = infinity

# the parents table
parents = Dict()
parents["a"] = "start"
parents["b"] = "start"
parents["fin"] = nothing

processed = []

function find_lowest_cost_node(costs)
    lowest_cost = Inf
    lowest_cost_node = nothing
    for node in keys(costs)
        cost = costs[node]
        if cost < lowest_cost && node ∉ processed
            lowest_cost = cost
            lowest_cost_node = node
        end
    end
    return lowest_cost_node
end

node = find_lowest_cost_node(costs)
while node != nothing
    global node
    cost = costs[node]
    neighbors = graph[node]
    for n in keys(neighbors)
        new_cost = cost + neighbors[n]
        if costs[n] > new_cost
            costs[n] = new_cost
            parents[n] = node
        end
    end
    push!(processed,node)
    node = find_lowest_cost_node(costs)
end

println("Cost from the start to each node:")
println(costs)
