#include<stdio.h>
#include<stdlib.h>
#include"game.h"


int main(){
    void* space = malloc(sizeof(Game));
    struct Game* g = space;
    startGame(g);
    return 0;
}