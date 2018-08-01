defmodule SelectionSort do
  def sort(list), do: do_sort(list, [])

  defp do_sort([], acc), do: Enum.reverse(acc)

  defp do_sort(list, acc) do
    smallest_index = find_smallest_index(list, 0, nil, nil)
    {smallest_value, list_rest} = List.pop_at(list, smallest_index)
    do_sort(list_rest, [smallest_value | acc])
  end

  defguardp new_smallest_value?(value, min_value) when is_nil(min_value) or value < min_value

  defp find_smallest_index([], _, _, min_index), do: min_index

  defp find_smallest_index([head | tail], index, min_value, _)
       when new_smallest_value?(head, min_value),
       do: find_smallest_index(tail, index + 1, head, index)

  defp find_smallest_index([_ | tail], index, min_value, min_index),
    do: find_smallest_index(tail, index + 1, min_value, min_index)
end

IO.inspect(SelectionSort.sort([5, 3, 6, 2, 10]))
