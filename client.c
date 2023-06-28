#include<windows.h>
#include "lib/linked.h"
#include "include.h"
#include "lib/c_socket.h"

struct Game{
    int num;
    // struct LinkedList* ll;
    // struct LinkedHashTable* lht;
    struct LinkedHashTable* tokens;
    struct LinkedHashTable* var;
    G_sock* server;
};
void startClient(struct Game* game);

int main(){
    void* space = malloc(sizeof(struct Game));
    struct Game* g = space;
    startClient(g);
    free(g);
    return 0;
}
void startClient(struct Game* game){
    //sockaddr_in
    int carryCheck = 0;
    char chptr[64];
    game->server = summonSocketUDP(127,0,0,1);

    // connectSocketUDP(g);
    strcpy(chptr,"hello from c client!\0");
    sendSocketUDP(game->server,chptr,21);
    recvSocketUDP(game->server,chptr,64);
    printf("%s\n",chptr);
    closeSocketUDP(game->server);
}