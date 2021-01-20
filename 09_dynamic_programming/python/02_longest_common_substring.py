dp_table_blue = ["b", "l", "u", "e"]
dp_table_clues = ["c", "l", "u", "e", "s"]
dp_table = [[0 for i in range(len(dp_table_blue))] for i in range(len(dp_table_clues))] # (5,4)
print(dp_table)

for i in range(0, len(dp_table_blue)):
    for j in range(0, len(dp_table_clues)):
        if dp_table_clues[j] == dp_table_blue[i]:
            dp_table[i][j] = dp_table[i-1][i-1] + 1

print(dp_table)