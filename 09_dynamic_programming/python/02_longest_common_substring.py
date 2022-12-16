dp_table_blue = ["b", "l", "u", "e"]
dp_table_clues = ["c", "l", "u", "e", "s"]
dp_table = [[0 for i in range(len(dp_table_blue))] for i in range(len(dp_table_clues))]
print(dp_table)  

for i in range(0, len(dp_table_clues)):
    for j in range(0, len(dp_table_blue)):
        if dp_table_clues[i] == dp_table_blue[j]:
            dp_table[i][j] = dp_table[i - 1][j - 1] + 1
        else:
            dp_table[i][j] = 0

print(dp_table)
