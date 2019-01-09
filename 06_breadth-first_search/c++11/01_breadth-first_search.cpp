#include <iostream>
#include <unordered_map>
#include <string>
#include <vector>
#include <queue>
#include <unordered_set>

using std::cout;
using std::endl;

bool is_seller(const std::string& name) {
    return name.back() == 'm';
}

template <typename T>
bool search(const T& name, const std::unordered_map<T, std::vector<T>>& graph) {
    std::queue<T> search_queue;
    std::unordered_set<T> searched;

    // add all friends to search queue
    for (auto friend_name : graph.find(name) -> second) {
        search_queue.push(friend_name);
    }

    while (!search_queue.empty()) {
        T& person = search_queue.front();
        search_queue.pop();

        // only search this person if you haven't already searched them.
        if (searched.find(person) == searched.end()) {
            if (is_seller(person)) {
                cout << person << " is a mango seller!" << endl;
                return true;
            }
            std::vector<T> friend_list = graph.find(person) -> second;
            
            // add all friends of a person to search queue
            for (T friend_name : friend_list) {
                search_queue.push(friend_name);
            }

            // mark this person as searched
            searched.insert(person);
        }
    }

    return false;
}

int main() {
    std::unordered_map<std::string, std::vector<std::string>> graph;
    graph.insert({"you", {"alice", "bob", "claire"}});
    graph.insert({"bob", {"anuj", "peggy"}});
    graph.insert({"alice", {"peggy"}});
    graph.insert({"claire", {"thom", "jonny"}});
    graph.insert({"anuj", {}});
    graph.insert({"peggy", {}});
    graph.insert({"thom", {}});
    graph.insert({"jonny", {}});

    std::string name = "you";
    bool result = search(name, graph);
    cout << "Found mango seller: " << result << endl;
}