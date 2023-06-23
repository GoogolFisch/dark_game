#include "c_socket.h"

// #ifdef __WIN32__
// # include <winsock2.h>
G_sock* summonSocketUDP(long a,long b,long c,long d){
    // wsa check if possible!
#if defined(_WIN32) || defined(_WIN64)    
    WSADATA wsa;
    if(WSAStartup(MAKEWORD(2,2),&wsa) != 0){
        printf("\nError: Windows socket subsytsem could not be initialized. Error Code: %d. Exiting..\n", WSAGetLastError());
        perror("\nError: Windows socket subsytsem could not be initialized. Error Code: %d. Exiting..\n");
        exit(1);
    }
#endif
    G_sock* sock = malloc(sizeof(G_sock));
    sock->socketID = socket(AF_INET,SOCK_DGRAM,0);
    sock->server = malloc(sizeof(struct sockaddr_in));

    memset(sock->server,0,sizeof(struct sockaddr_in));

    unsigned long uAddr = inet_addr("127.0.0.1");
    printf("IP: %lx>%lx",uAddr,d + c * 256 + b * 65536 + a * 16777216);
    sock->server->sin_addr.S_un.S_addr = uAddr;
    // sock->server->sin_addr.S_un.S_addr = a + b << 8 + c << 16 + d << 24;
    sock->server->sin_family = AF_INET;
    sock->server->sin_port = htons(9999);

    return sock;
}

void connectSocketUDP(G_sock* sock){
    int result = connect(sock->socketID,(struct sockaddr*)(sock->server),sizeof(*sock->server));
    if(result < 0){
        printf("Error: Could not connect to server: %s. Exiting..\n", strerror(errno));
        perror("Error: Could not connect to server: %s. Exiting..\n");
        exit(1);
    }

}

void sendSocketUDP(G_sock* sock,char* message,int length){
    int result = sendto(sock->socketID,message,length,0,(struct sockaddr*)sock->server,sizeof(*sock->server));
    if(result < 0){
        printf("Error: Could not send to otherSide: %s. Exiting.. result:%i\n", strerror(errno),result);
        perror("Error: Could not send to otherSide.\n");
        exit(1);
    }
}

int recvSocketUDP(G_sock* sock,char* message,int size){
    int result = recv(sock->socketID,message,size,0);// message get size
    // int result = recvfrom(sock->socketID,message,size,0,(struct sockaddr*)sock->server,sizeof(*sock->server));// message get size
    if(result < 0){
        printf("Error: Something wrong happened while getting reply from otherSide: %s. Exiting.. result:%i\n", strerror(errno),result);
    }
    return result;
}

void closeSocketUDP(G_sock* sock){
#if defined(_WIN32) || defined(_WIN64)  
    closesocket(sock->socketID);
    WSACleanup();
#else
    close(sock->socketID);
#endif
}
// #else
// # include <sys/socket.h>
// void closeSocketUDP(G_sock* sock){
//     close(socket->socketID);
// }
// #endif