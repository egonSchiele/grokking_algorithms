defmodule BinarySearch do
  def search(list, item) do
    low = 0
    high = length(list) - 1

    do_search(list, item, low, high)
  end

  defp do_search(_, _, low, high) when high < low, do: nil

  defp do_search(list, item, low, high) do
    mid = div(low + high, 2)
    guess = Enum.at(list, mid)

    cond do
      guess == item -> mid
      guess > item -> do_search(list, item, low, mid - 1)
      true -> do_search(list, item, mid + 1, high)
    end
  end
end

my_list = [1, 3, 5, 7, 9]

IO.puts(BinarySearch.search(my_list, 3))
# => 1

IO.inspect(BinarySearch.search(my_list, -1))
# => nil
