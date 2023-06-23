#ifndef G_SOCKET_H_
#define G_SOCKET_H_
#include"../include.h"

#if defined(_WIN32) || defined(_WIN64)
    #include <winsock2.h>
#else
    #include <sys/socket.h>
    #include <arpa/inet.h>
#endif

// #ifdef __WIN32__
// # include <winsock2.h>
// #else
// # include <sys/socket.h>
// #endif

typedef struct G_sock {
    int socketID;
    struct sockaddr_in* server;
} G_sock;

G_sock* summonSocketUDP(long a,long b,long c,long d);
void connectSocketUDP(G_sock* sock);
void sendSocketUDP(G_sock* sock,char* message,int length);
int recvSocketUDP(G_sock* sock,char* message,int size);
void closeSocketUDP(G_sock* sock);

#endif