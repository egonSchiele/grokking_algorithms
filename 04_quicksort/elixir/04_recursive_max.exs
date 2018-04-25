defmodule Recursive do
  def max([x]), do: x

  def max([head | tail]) do
    get_max(head, max(tail))
  end

  defp get_max(x, y) when x > y, do: x
  defp get_max(_, y), do: y
end

IO.puts(Recursive.max([1, 5, 10, 25, 16, 1]))
