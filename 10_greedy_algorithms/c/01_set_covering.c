#include <stdio.h>
#include <string.h>

typedef struct {
  char *name;
  char **states;
} Station;

Station stations[] = {
    {"kone", (char *[]){"id", "nv", "ut", NULL}},
    {"ktwo", (char *[]){"wa", "id", "mt", NULL}},
    {"kthree", (char *[]){"or", "nv", "ca", NULL}},
    {"kfour", (char *[]){"nv", "ut", NULL}},
    {"kfive", (char *[]){"ca", "az", NULL}},
};

#define NUM_STATIONS (sizeof(stations) / sizeof(stations[0]))

int contains(char **list, char *value) {
  for (int i = 0; list[i]; i++)
    if (strcmp(list[i], value) == 0)
      return 1;
  return 0;
}

int count_coverage(char **states_needed, int needed_count, char **station_states) {
  int count = 0;
  for (int i = 0; i < needed_count; i++)
    if (contains(station_states, states_needed[i]))
      count++;
  return count;
}

int main(void) {
  char *states_needed[] = {"mt", "wa", "or", "id", "nv", "ut", "ca", "az"};
  int needed_count = sizeof(states_needed) / sizeof(states_needed[0]);

  int used[NUM_STATIONS] = {0};
  char *final_stations[NUM_STATIONS];
  int final_count = 0;

  while (needed_count > 0) {
    int best = -1;
    int best_coverage = 0;

    for (int i = 0; i < (int)NUM_STATIONS; i++) {
      if (used[i])
        continue;
      int coverage = count_coverage(states_needed, needed_count, stations[i].states);
      if (coverage > best_coverage) {
        best = i;
        best_coverage = coverage;
      }
    }

    if (best == -1)
      break;

    used[best] = 1;
    final_stations[final_count++] = stations[best].name;

    int remaining = 0;
    for (int i = 0; i < needed_count; i++) {
      if (!contains(stations[best].states, states_needed[i])) {
        states_needed[remaining++] = states_needed[i];
      }
    }
    needed_count = remaining;
  }

  for (int i = 0; i < final_count; i++)
    printf("%s\n", final_stations[i]);

  return 0;
}
