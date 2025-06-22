#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct GraphNode {
  char *key;
  char **values;
} GraphNode;

GraphNode graph[] = {
    {"you", (char *[]){"alice", "bob", "claire", NULL}},
    {"bob", (char *[]){"anuj", "peggy", NULL}},
    {"alice", (char *[]){"peggy", NULL}},
    {"claire", (char *[]){"thom", "jonny", NULL}},
    {"anuj", NULL},
    {"peggy", NULL},
    {"thom", NULL},
    {"jonny", NULL},
};

typedef struct QueueNode {
  char *name;
  struct QueueNode *next;
} QueueNode;

typedef struct Queue {
  struct QueueNode *head;
  struct QueueNode *tail;
} Queue;

void enqueue(Queue *queue, char *name) {
  QueueNode *node = (QueueNode *)malloc(sizeof(QueueNode));
  node->name = name;
  node->next = NULL;
  if (queue->tail) {
    queue->tail->next = node;
    queue->tail = node;
  } else {
    queue->head = queue->tail = node;
  }
}

char *dequeue(Queue *queue) {
  if (!queue->head)
    return NULL;
  QueueNode *node = queue->head;
  char *name = node->name;
  queue->head = queue->head->next;
  if (!queue->head)
    queue->tail = NULL;
  free(node);
  return name;
}

int queue_empty(Queue *queue) { return queue->head == NULL; }

void free_queue(Queue *queue) {
  while (queue->head) {
    QueueNode *node = queue->head;
    queue->head = queue->head->next;
    free(node);
  }
  queue->tail = NULL;
}

char **get_neighbors(char *name) {
  for (int i = 0; i < sizeof(graph) / sizeof(graph[0]); i++) {
    if (strcmp(graph[i].key, name) == 0) {
      return graph[i].values;
    }
  }
  return NULL;
}

int person_is_seller(char *name) {
  int len = strlen(name);
  return len > 0 && name[len - 1] == 'm';
}

int contains(char **list, int count, char *name) {
  for (int i = 0; i < count; i++) {
    if (strcmp(list[i], name) == 0) {
      return 1;
    }
  }
  return 0;
}

int search(char *name) {
  Queue queue = {NULL, NULL};
  char **neighbors = get_neighbors(name);
  if (neighbors) {
    for (int i = 0; neighbors[i]; i++) {
      enqueue(&queue, neighbors[i]);
    }
  }

  char **searched = NULL;
  int searched_count = 0;
  int searched_cap = 0;

  int found = 0;
  while (!queue_empty(&queue)) {
    char *person = dequeue(&queue);
    if (!contains(searched, searched_count, person)) {
      if (person_is_seller(person)) {
        printf("%s is a mango seller\n", person);
        found = 1;
        break;
      }
      char **neighbors = get_neighbors(person);
      if (neighbors) {
        for (int i = 0; neighbors[i]; i++) {
          enqueue(&queue, neighbors[i]);
        }
      }
      if (searched_count >= searched_cap) {
        searched_cap = searched_cap ? searched_cap * 2 : 4;
        searched = realloc(searched, searched_cap * sizeof(char *));
      }
      searched[searched_count++] = person;
    }
  }

  free_queue(&queue);
  free(searched);
  return found;
}

int main() {
  search("you");
  return 0;
}
