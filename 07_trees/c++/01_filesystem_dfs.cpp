#include <algorithm>
#include <filesystem>
#include <iostream>
#include <vector>

void printnames(const std::filesystem::path &dir) {
  std::vector<std::filesystem::directory_entry> entries;
  for (const auto &entry : std::filesystem::directory_iterator(dir)) {
    entries.push_back(entry);
  }

  std::sort(entries.begin(), entries.end(),
            [](const std::filesystem::directory_entry &a,
               const std::filesystem::directory_entry &b) {
              return a.path().filename() < b.path().filename();
            });

  for (const auto &entry : entries) {
    if (entry.is_regular_file()) {
      std::cout << entry.path().filename().string() << std::endl;
    } else if (entry.is_directory()) {
      printnames(entry.path());
    }
  }
}

int main() {
  printnames("pics");
  return 0;
}
