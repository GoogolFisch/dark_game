#include "game.h"

void startGame(Game* game){
    //sockaddr_in
    char chptr[64];
    bool running = true;
    game->var = summonLHT();
    while(running){
        scanf("%64c",&chptr);
        if (chptr[0] == 'e'){
            running = false;
        }
        printf("%64c",&chptr);
    }
    freeLHT(game->var);
}