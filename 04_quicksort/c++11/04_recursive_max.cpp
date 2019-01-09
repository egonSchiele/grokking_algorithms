#include <iostream>
#include <vector>
#include <stdexcept>

using std::cout;
using std::endl;

template <typename T>
T max(std::vector<T> arr) {
    if (arr.empty()) throw std::invalid_argument("Cannot select max value from empty sequence");
    if (arr.size() == 1) return arr.at(0);

    T back = arr.back();
    arr.pop_back();

    T sub_max = max(arr);
    
    return back > sub_max ? back : sub_max;
}

int main() {
    std::vector<int> array = {1, 5, 10, 25, 16, 1};
    cout << max(array) << endl;

    std::vector<int> negative_array = {-1, -5, -10, -25, -16};
    cout << max(negative_array) << endl;
}
