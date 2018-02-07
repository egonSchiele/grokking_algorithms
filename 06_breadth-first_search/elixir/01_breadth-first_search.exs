defmodule BreadthFirstSearch do
  def search(graph, initial_vertex, search_fn) do
    initial_search_queue = list_to_queue(graph[initial_vertex])
    do_search(initial_search_queue, search_fn, [], graph)
  end

  defp do_search(_empty_queue = {[], []}, _, _, _), do: nil

  defp do_search(search_queue, search_fn, searched_list, graph) do
    {{:value, value}, rest_queue} = :queue.out(search_queue)

    cond do
      value in searched_list ->
        do_search(rest_queue, search_fn, searched_list, graph)

      search_fn.(value) ->
        value

      true ->
        continue_search(rest_queue, value, search_fn, searched_list, graph)
    end
  end

  defp continue_search(search_queue, value, search_fn, searched_list, graph) do
    join_with_search_queue = &:queue.join(search_queue, &1)

    updated_search_queue =
      graph[value]
      |> list_to_queue()
      |> join_with_search_queue.()

    do_search(updated_search_queue, search_fn, [value | searched_list], graph)
  end

  defp list_to_queue(list), do: :queue.from_list(list)
end

graph = %{
  "you" => ["alice", "bob", "claire"],
  "bob" => ["anuj", "peggy"],
  "alice" => ["peggy"],
  "claire" => ["thom", "jonny"],
  "anuj" => [],
  "peggy" => [],
  "thom" => [],
  "jonny" => []
}

person_is_seller? = &String.ends_with?(&1, "m")

name = BreadthFirstSearch.search(graph, "you", person_is_seller?)
IO.puts("#{name} is a mango seller!")
