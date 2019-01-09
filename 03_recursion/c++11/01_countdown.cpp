#include <iostream>

using std::cout;
using std::endl;

void countdown(const int& i) {
    cout << i << endl;
    
    // base case
    if (i <= 0) return;\
    
    // recursive case
    countdown(i - 1);
}

int main() {
    countdown(5);
}
