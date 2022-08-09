#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>

typedef struct {

    char *key;
    int value;

} item;

typedef struct {

    item *items;
    int size;

} hashMap;

hashMap *newHashMap(int);
void deleteHashMap(hashMap *);
void addElementToMap(hashMap *, char *, int);
int getElementFromMap(hashMap *, char *);

void checkVoter(hashMap *map, char *name) {

    if(getElementFromMap(map, name)) {

        printf("kick tem out!\n");

    } else {
    
        addElementToMap(map, name, true);
        printf("let tem vote!\n");

    }

}

int main(void) {

    hashMap *voted = newHashMap(32);
    checkVoter(voted, "tom");
    checkVoter(voted, "mike");
    checkVoter(voted, "mike");
    deleteHashMap(voted);

    return EXIT_SUCCESS;

}

uint32_t PJWHash(unsigned char *str, uint32_t m) {

    uint32_t hash = 0, test = 0;

    for (; *str; ++str) {

        hash = (hash << 4) + *str;

        if ((test = hash & 0xf0000000) != 0) {

            hash = (hash ^ (test >> 24)) & 0xffffffff;

        }

    }

    return hash % m;

}

hashMap *newHashMap(int size) {

    hashMap *map = (hashMap *)calloc(1, sizeof(hashMap));
    map->size = size;
    map->items = (item *)calloc(map->size,sizeof(item));
    for (int i = 0; i < map->size; ++i) {

        map->items[i].key = NULL;

    } 
    return map;

}

void deleteHashMap(hashMap *map) {

    for (int i = 0; i < map->size; ++i) {

        if (map->items[i].key != NULL) {

            free(map->items[i].key);

        }

    }
    free(map->items);
    free(map);

}

void addElementToMap(hashMap *map, char *key, int element) {

    int index = PJWHash((unsigned char *)key, map->size);
    if (map->items[index].key == NULL) {

        map->items[index].key = (char *)calloc(strlen(key) + 1, sizeof(char));
        strcpy(map->items[index].key, key);

    } else {

        strcpy(map->items[index].key, key);

    }
    map->items[index].value = element;

}

int getElementFromMap(hashMap *map, char *key) {

    int index = PJWHash((unsigned char *)key, map->size);
    return map->items[index].value;

}
