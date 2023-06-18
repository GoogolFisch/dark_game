#include "g_socket.h"

#ifdef __WIN32__
# include <winsock2.h>
G_sock* summonSocketUDP(char a,char b,char c,char d){
    int socketID = socket(PF_INET,SOCK_DGRAM,0);
    G_sock* g = malloc(sizeof(G_sock));

    return g;
}
#else
# include <sys/socket.h>
#endif