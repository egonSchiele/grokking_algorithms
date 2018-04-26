defmodule DijkstrasAlgorithm do
  def find_shortest_path(graph, costs, parents),
    do: do_find_shortest_path(graph, costs, parents, [])

  defp do_find_shortest_path(graph, costs, parents, processed) do
    find_lowest_cost_node(costs, processed)
    |> process_node(processed, graph, costs, parents)
  end

  defp process_node(nil, _, _, costs, parents), do: {costs, parents}

  defp process_node(node, processed, graph, costs, parents) do
    node_cost = costs[node]
    neighbors = for(neighbor_node_cost <- graph[node], do: neighbor_node_cost)

    {new_costs, new_parents} = process_node_neighbors(node, node_cost, neighbors, costs, parents)

    do_find_shortest_path(graph, new_costs, new_parents, [node | processed])
  end

  defp process_node_neighbors(node, node_cost, neighbors, costs, parents)

  defp process_node_neighbors(_, _, [], costs, parents), do: {costs, parents}

  defp process_node_neighbors(node, node_cost, [neighbor | tail], costs, parents) do
    {neighbor_node, neighbor_cost} = neighbor
    new_cost = node_cost + neighbor_cost

    if costs[neighbor_node] > node_cost + neighbor_cost do
      new_costs = %{costs | neighbor_node => new_cost}
      new_parents = %{parents | neighbor_node => node}

      process_node_neighbors(node, node_cost, tail, new_costs, new_parents)
    else
      process_node_neighbors(node, node_cost, tail, costs, parents)
    end
  end

  defp find_lowest_cost_node(costs, processed) do
    {lowest_cost_node, _} =
      for({node, cost} <- costs, node not in processed, do: {node, cost})
      |> find_lowest_cost

    lowest_cost_node
  end

  defp find_lowest_cost([]), do: {nil, :infinity}

  defp find_lowest_cost([node_cost | []]), do: node_cost

  defp find_lowest_cost([node_cost = {_, cost} | tail]) do
    (min_node_cost = {_, min_cost}) = find_lowest_cost(tail)

    if cost < min_cost,
      do: node_cost,
      else: min_node_cost
  end
end

# the graph
graph = %{
  "start" => %{"a" => 6, "b" => 2},
  "a" => %{"fin" => 1},
  "b" => %{"a" => 3, "fin" => 5},
  "fin" => %{}
}

# the costs table
costs = %{
  "a" => 6,
  "b" => 2,
  "fin" => :infinity
}

# the parents table
parents = %{
  "a" => "start",
  "b" => "start",
  "fin" => nil
}

{costs, _} = DijkstrasAlgorithm.find_shortest_path(graph, costs, parents)
IO.puts("Cost from the start to each node:")
IO.inspect(costs)
