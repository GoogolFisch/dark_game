#include<windows.h>
#include "lib/linked.h"
#include "include.h"
#include "lib/s_socket.h"

struct Game{
    int num;
    // struct LinkedList* ll;
    // struct LinkedHashTable* lht;
    struct LinkedHashTable* tokens;
    struct LinkedHashTable* var;
};
void startServer(struct Game* game);

int main(){
    void* space = malloc(sizeof(struct Game));
    struct Game* g = space;
    startServer(g);
    free(g);
    return 0;
}
void startServer(struct Game* game){
    //sockaddr_in
    char chptr[64];
    G_sock* g;
    G_sock* buff;
    int n;
    buff = malloc(sizeof(G_sock));
    buff->length = sizeof(struct sockaddr_in);
    buff->conn = malloc(buff->length);
    // memset(&buff->conn,0,sizeof(struct sockaddr_in));
    g = summonSocketUDP();
    // g->doErr = true;
    while(1){
        n = recvSocketUDP(g,buff,chptr,64);
        if(n >= 0){
            printf("%s\n",chptr);
            printf("%lx\n",buff->conn->sin_addr.S_un.S_addr);
            sendSocketUDP(g,buff,"Got your c message\n\0",20);
        }
        Sleep(100);
    }
    // chptr[n] = '\0';
    // strcpy(chptr,"hello from c server!\0");
    // sendSocketUDP(g,buff,chptr,21);
    printf("%s\n",chptr);
    closeSocketUDP(g);
}