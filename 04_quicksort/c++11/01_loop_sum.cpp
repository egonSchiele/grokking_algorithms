#include <iostream>
#include <vector>

using std::cout;
using std::endl;

template <typename T>
T sum(const std::vector<T>& arr) {
    T sum = 0;
    for (T item : arr) {
        sum += item;
    }

    return sum;
}

int main() {
    std::vector<int> arr_int = {1, 2, 3, 4};
    std::vector<float> arr_float = {0.1, 0.2, 0.3, 0.4, 0.5};

    cout << "Sum ints: " << sum(arr_int) << endl;
    cout << "Sum floats: " << sum(arr_float) << endl;
}
