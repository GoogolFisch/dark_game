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
    G_sock* g;
    g = summonSocketUDP(127,0,0,1);
    // connectSocketUDP(g);
    strcpy(chptr,"hello from c client!\0");
    sendSocketUDP(g,chptr,21);
    for(carryCheck=0;carryCheck<10;carryCheck++){
        Sleep(1000);
        recvSocketUDP(g,chptr,64);
    }
    printf("%s\n",chptr);
    closeSocketUDP(g);
}