defmodule Quicksort do
  import Enum, only: [split_with: 2]

  def sort(list) when length(list) < 2, do: list

  def sort([pivot | tail]) do
    {less, greater} = split_with(tail, &(&1 <= pivot))
    sort(less) ++ [pivot | sort(greater)]
  end
end

IO.inspect(Quicksort.sort([10, 5, 2, 3]))
