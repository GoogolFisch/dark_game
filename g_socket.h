#ifndef G_SOCKET_H_
#define G_SOCKET_H_
#include"include.h"

#ifdef __WIN32__
# include <winsock2.h>
#else
# include <sys/socket.h>
#endif

typedef struct G_sock {
    int socketID;
} G_sock;

G_sock* summonSocketUDP(char a,char b,char c,char d);


#endif