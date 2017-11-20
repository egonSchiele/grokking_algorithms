if word_a[i] == word_b[j] then
    -- The letters match.
    cell[i][j] = cell[i - 1][j - 1] + 1
else
    -- The letters don't match.
    cell[i][j] = math.max(cell[i - 1][j], cell[i][j - 1])
end