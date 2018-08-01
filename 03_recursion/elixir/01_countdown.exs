defmodule Countdown do
  defguardp non_positive?(x) when x <= 0

  def from(i) when non_positive?(i), do: nil

  def from(i) do
    IO.puts(i)
    from(i - 1)
  end
end

Countdown.from(5)
