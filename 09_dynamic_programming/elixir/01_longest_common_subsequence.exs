# `cell` is a map of maps here, e.g.
# cell = %{
#   0 => %{0 => 0, ...},
#   1 => %{...},
#   ...
# }

if String.at(word_a, i) == String.at(word_a, j) do
  put_in(cell[i - 1][j - 1], cell[i - 1][j - 1] + 1)
else
  put_in(cell[i - 1][j - 1], max(cell[i - 1][j], cell[i][j - 1]))
end
