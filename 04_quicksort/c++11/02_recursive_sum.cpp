#include <iostream>
#include <vector>

using std::cout;
using std::endl;

template <typename T>
T sum(std::vector<T> arr) {
    if (arr.empty()) return 0;

    T last_num = arr.back(); // save last number value
    arr.pop_back();  // and remove it from array for next recursive call
    return last_num + sum(arr);
}

int main() {
    std::vector<int> arr_int = {1, 2, 3, 4};
    std::vector<float> arr_float = {0.1, 0.2, 0.3, 0.4, 0.5};

    cout << "Sum ints: " << sum(arr_int) << endl;
    cout << "Sum floats: " << sum(arr_float) << endl;
}
