#include "s_socket.h"

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
    sock->conn = malloc(sizeof(struct sockaddr_in));

    if(sock->socketID < 0){
        printf("Error: Could not create socket: %s. Exiting..\n", strerror(errno));
        perror("Can't create");
        exit(1);
    }

    memset(sock->conn,0,sizeof(struct sockaddr_in));

    unsigned long uAddr = inet_addr("127.0.0.1");
    printf("IP: %lx>%lx",uAddr,d + c * 256 + b * 65536 + a * 16777216);
    // sock->conn->sin_addr.S_un.S_addr = uAddr;
    sock->conn->sin_addr.S_un.S_addr = INADDR_ANY;
    // sock->conn->sin_addr.S_un.S_addr = a + b << 8 + c << 16 + d << 24;
    sock->conn->sin_family = AF_INET;
    sock->conn->sin_port = htons(9999);

    return sock;
}


G_sock* acceptSocketUDP(G_sock* sock){
    G_sock* client = malloc(sizeof(G_sock));
    client->socketID = accept(sock->socketID,(struct sockaddr*)sock->conn,sizeof(*sock->conn));
    client->conn = sock->conn;
    return client;
}
void bindSocketUDP(G_sock* sock){
    if ((bind(sock->socketID, (struct sockaddr *) sock->conn, sizeof(*sock->conn))) == -1) {
        printf("Error: Could not bind server: %s. Exiting..\n", strerror(errno));
        perror("Can't bind");
        exit(1);
    }
}

void sendSocketUDP(G_sock* sock,G_sock* buff,char* message,int length){
    int result = sendto(sock->socketID,message,length,0,(struct sockaddr*)buff->conn,sizeof(*buff->conn));
    if(result < 0){
        printf("Error: Could not send to otherSide: %s. Exiting.. result:%i\n", strerror(errno),result);
        perror("Error: Could not send to otherSide.\n");
        exit(1);
    }
}

int recvSocketUDP(G_sock* sock,G_sock* buff,char* message,int size){
    int s = sizeof(*buff->conn);
    int result = recvfrom(sock->socketID,message,size,0,(struct sockaddr*)buff->conn,&s);// message get size
    buff->socketID = s;
    if(result < 0){
        printf("Error: Something wrong happened while getting reply from otherSide: %s. Exiting.. result:%i\n", strerror(errno),result);
    }
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