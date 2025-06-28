#include <dirent.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

int filter(const struct dirent *entry) {
  return strcmp(entry->d_name, ".") != 0 && strcmp(entry->d_name, "..") != 0;
}

void printnames(const char *dir) {
  struct dirent **entries;
  int count = scandir(dir, &entries, filter, alphasort);

  if (count < 0) {
    perror("scandir");
    return;
  }

  for (int i = 0; i < count; i++) {
    char path[PATH_MAX];
    snprintf(path, sizeof(path), "%s/%s", dir, entries[i]->d_name);

    struct stat sb;
    if (stat(path, &sb)) {
      perror("stat");
      free(entries[i]);
      continue;
    }

    if (S_ISREG(sb.st_mode)) {
      printf("%s\n", entries[i]->d_name);
    } else if (S_ISDIR(sb.st_mode)) {
      printnames(path);
    }

    free(entries[i]);
  }
  free(entries);
}

int main() {
  printnames("pics");
  return 0;
}
