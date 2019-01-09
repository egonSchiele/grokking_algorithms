#include <iostream>
#include <unordered_map>
#include <string>

using std::cout;
using std::endl;

std::unordered_map<std::string, bool> voted;

void check_voter(const std::string& name) {
    auto search = voted.find(name);
    if (search == voted.end() || search->second == false) {
        voted.insert({name, true});
        cout << "Let them vote!" << endl;;
    } else {
        cout << "Kick them out!" << endl;
    }
}

int main() {
    check_voter("tom");
    check_voter("mike");
    check_voter("mike");
}