#include <iostream>
#include <algorithm>

int main() {
	std::string wordA = "Fish", wordB = "Fosh";
	const size_t& aSize = wordA.size(), &bSize = wordB.size();

	size_t** table = new size_t* [aSize];
	for (size_t l = 0; l < aSize; ++l)
		table[l] = new size_t[bSize]{}; // all values in table will be initialized as zero

	for (size_t i = 0; i < aSize; ++i)
		for (size_t j = 0; j < bSize; ++j)
			if (wordA[i] == wordB[j])
				if (i > 0 && j > 0)
					table[i][j] = table[i - 1][j - 1] + 1;
				else
					table[i][j] = 1;
			else
				if (i > 0 && j > 0)
					table[i][j] = std::max(table[i - 1][j], table[i][j - 1]);
				else if (i == 0 && j > 0)
					table[i][j] = table[i][j - 1];
				else if (i > 0 && j == 0)
					table[i][j] = table[i - 1][j];
				else
					table[i][j] = 0;

	for (size_t i = 0; i < aSize; ++i) {
		std::cout << "[ ";
		for (size_t j = 0; j < bSize; ++j)
			std::cout << table[i][j] << ' ';
		std::cout << ']' << std::endl;
	}

	// [1 1 1 1]
	// [1 1 1 1]
	// [1 1 2 2]
	// [1 1 2 3]

	system("pause");
	return 0;
}
