#include "game.h"

void startGame(Game* game){
    //sockaddr_in
    char chptr[64];
    G_sock* g;
    g = summonSocketUDP(127,0,0,1);
    connectSocketUDP(g);
    strcpy(chptr,"hello from c client!\0");
    sendSocketUDP(g,chptr,21);
    recvSocketUDP(g,chptr,64);
    printf("%64c\n",chptr);
    closeSocketUDP(g);
}