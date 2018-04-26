defmodule Recursive do
  def count([]), do: 0
  def count([_ | tail]), do: 1 + count(tail)
end

IO.puts(Recursive.count([0, 1, 2, 3, 4, 5]))
