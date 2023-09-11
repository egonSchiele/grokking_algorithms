#include <iostream>
#include <vector>

using std::cout;
using std::endl;

template <typename T>
int binary_search(const std::vector<T>& list, const T& item) {
    int low = 0;
    int high = list.size() - 1;

    while (low <= high) {
        int mid = (low + high) / 2;
        T guess = list[mid];

        if (guess == item) {
            return mid;
        }

        if (guess > item) {
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }

    return -1;
}

// this function returns pointer to the found element rather than array index
template <typename T>
const T* binary_search2(const std::vector<T>& list, const T& item) {
    const T* low = &list.front();
    const T* high = &list.back();

    while (low <= high) {
        // "guess" is the element in the middle between "high" and "low"
        const T* guess = low + ((high - low) / 2);

        if (*guess == item) 
            return guess;
        
        if (*guess > item) {
            high = guess - 1;
        } else {
            low = guess + 1;
        }
    }

    return nullptr;
}

int main() {
    std::vector<int> my_list = {1, 3, 5, 7, 9};
    const int* binary_search2_result = binary_search2(my_list, 9);
    const int* binary_search2_null = binary_search2(my_list, 4); // test finding element that is not in the list

    cout << "Binary search for number 3: " << binary_search(my_list, 3) << endl;
    cout << "Binary search 2 for number 9 (memory address): " << binary_search2_result << endl;
    cout << "Binary search 2 for number 9 (value): " << *binary_search2_result << endl;
    
    if (binary_search2_null == nullptr) {
		cout << "4 was not found in the list" << endl;
	}

    return 0;
}
