defmodule LCSubsequence do
  def generate_table(word_a, word_b) do
    word_a
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {_x, index}, acc ->
      nested_map =
        word_b
        |> Enum.with_index()
        |> Enum.reduce(%{}, fn {_x, index}, acc ->
          Map.put(acc, index, 0)
        end)

      Map.put(acc, index, nested_map)
    end)
  end

  def compute(table, word_a, word_b) do
    for i <- 0..(length(word_a) - 1), reduce: table do
      table ->
        for j <- 0..(length(word_b) - 1), reduce: table do
          table ->
            if Enum.at(word_a, i) == Enum.at(word_b, j) do
              value = (table[i - 1][j - 1] || 0) + 1
              put_in(table[i][j], value)
            else
              first = table[i - 1][j] || 0
              second = table[i][j - 1] || 0
              put_in(table[i][j], max(first, second))
            end
        end
    end
  end
end

word_a = ["b", "l", "u", "e"]
word_b = ["c", "l", "u", "e", "s"]

result =
  word_a
  |> LCSubsequence.generate_table(word_b)
  |> LCSubsequence.compute(word_a, word_b)

Enum.each(result, fn {_index, value} ->
  IO.inspect(Map.values(value))
end)

# Output
# [0, 0, 0, 0, 0]
# [0, 1, 1, 1, 1]
# [0, 1, 2, 2, 2]
# [0, 1, 2, 3, 3]
