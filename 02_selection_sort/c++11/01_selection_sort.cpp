#include <iostream>
#include <vector>

using std::cout;
using std::endl;

// Finds the smallest value in an array
template <typename T>
int find_smallest(const std::vector<T>& arr) {
    // stores smallest value
    T smallest = arr[0];
    // stores index of the smallest value
    int smallest_index = 0;

    for (int i = 0; i < arr.size(); i++) {
        if (arr[i] < smallest) {
            smallest = arr[i];
            smallest_index = i;
        }
    }

    return smallest_index;
}

template <typename T>
std::vector<T> selection_sort(std::vector<T> arr) {
    std::vector<T> sorted;

    while(!arr.empty()) {
        // find smallest element and add it to sorted array
        int smallest_index = find_smallest(arr);
        sorted.push_back(arr[smallest_index]);

        // remove smallest element from non-sorted array
        arr.erase(arr.begin() + smallest_index);
    }

    return sorted;
}

int main() {
    std::vector<float> arr = {1.2, 1.0, 3, 0, -1, 0.5, 100, -99};
    std::vector<float> sorted = selection_sort(arr);
    
    cout << "Sorted array: ";
    for (float num : sorted) {
        cout << num << " ";
    }
    cout << endl;
}