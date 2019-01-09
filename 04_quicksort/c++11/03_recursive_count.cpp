#include <iostream>
#include <vector>

using std::cout;
using std::endl;

template <typename T>
int count(std::vector<T> arr) {
    if (arr.empty()) return 0;
    arr.pop_back();
    return count(arr) + 1;
}

int main() {
    std::vector<int> array = {0, 1, 2, 3, 4, 5};
    cout << count(array) << endl;
}
