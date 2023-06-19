#include "g_socket.h"

// #ifdef __WIN32__
// # include <winsock2.h>
G_sock* summonSocketUDP(char a,char b,char c,char d){
    G_sock* sock = malloc(sizeof(G_sock));
    sock->socketID = socket(AF_INET,SOCK_DGRAM,0);

    memset(&sock->server,0,sizeof(sock->server));

    unsigned long uAddr = inet_addr("127.0.0.1");
    printf("Address%i %lx\n",uAddr,uAddr);
    sock->server.sin_addr.S_un.S_addr = uAddr;
    sock->server.sin_family = AF_INET;
    sock->server.sin_port = htons(25600);

    return sock;
}

void connectSocketUDP(G_sock* sock){
    int s = -1;
/*#if defined(_WIN32) || defined(_WIN64)    
    WSADATA wsa;
    if(WSAStartup(MAKEWORD(2,2),&wsa) != 0){
        printf("\nError: Windows socket subsytsem could not be initialized. Error Code: %d. Exiting..\n", WSAGetLastError());
        perror("\nError: Windows socket subsytsem could not be initialized. Error Code: %d. Exiting..\n");
        exit(1);
    }
#endif/**/
    if(connect(s,(struct sockaddr*)(&sock->server),sizeof(sock->server)) < 0){
        printf("Error: Could not connect to server: %s. Exiting..\n", strerror(errno));
        perror("Error: Could not connect to server: %s. Exiting..\n");
        exit(1);
    }

}

void sendSocketUDP(G_sock* sock,const char* message,int length){
    int result = send(sock->socketID,message,length,0);
    if(result < 0){
        printf("Error: Could not send http request to server: %s. Exiting..\n", strerror(errno));
        perror("Error: Could not send http request to server: %s. Exiting..\n");
        exit(1);
    }
}

int recvSocketUDP(G_sock* sock,const char* message,int size){
    int result = recv(sock->socketID,message,size,0);// message get size
    if(result < 0){
        printf("Error: Something wrong happened while getting reply from server: %s. Exiting..\n", strerror(errno));
        perror("Error: Something wrong happened while getting reply from server: %s. Exiting..\n");
        exit(1);
    }
}

void closeSocketUDP(G_sock* sock){
    closesocket(sock->socketID);
    WSACleanup();
}
// #else
// # include <sys/socket.h>
// void closeSocketUDP(G_sock* sock){
//     close(socket->socketID);
// }
// #endif