defmodule Factorial do
  def of(1), do: 1
  def of(n), do: n * of(n - 1)
end

IO.puts(Factorial.of(5))
