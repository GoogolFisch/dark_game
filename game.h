#ifndef GAME_H_
#define GAME_H_
//#include "g_socket.h"
#include "linked.h"
#include "include.h"
#include "g_socket.h"


typedef struct Game{
    int num;
    // struct LinkedList* ll;
    // struct LinkedHashTable* lht;
    struct LinkedHashTable* tokens;
    struct LinkedHashTable* var;
    int socketID;
} Game;
void startGame(Game* game);

#endif