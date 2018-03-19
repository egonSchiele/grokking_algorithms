wordA='blue'
wordB='clues'
lstA = list(wordA)
lstB = list(wordB)
#create a 4*5 matrix 
cell = [([0]*len(lstB)) for i in range(len(lstA))]

for x in range(1,len(lstA)):
	for y in range(1,len(lstB)):
		if lstA[x]==lstB[y]:
			cell[x][y]=cell[x-1][y-1]+1
		else:
			cell[x][y]=max(cell[x][y-1],cell[x-1][y])

print(cell)
print("the number of longest commom subsequence",cell[-1][-1])