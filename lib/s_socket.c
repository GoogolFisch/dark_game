#include "s_socket.h"

// #ifdef __WIN32__
// # include <winsock2.h>

// will summon and bind!
G_sock* summonSocketUDP(){
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
    sock->doErr = false;
    sock->socketID = socket(AF_INET,SOCK_DGRAM,0);
    sock->conn = malloc(sizeof(struct sockaddr_in));

    if(sock->socketID < 0){
        printf("Error: Could not create socket: %s. Exiting..\n", strerror(errno));
        perror("Can't create");
        exit(1);
    }
    sock->length = sizeof(sock->conn);
    memset(sock->conn,0,sizeof(sock->length));

    unsigned long uAddr = inet_addr("127.0.0.1");
    sock->conn->sin_addr.s_addr = INADDR_ANY;
    sock->conn->sin_family = AF_INET;
    sock->conn->sin_port = htons(9999);

    if (bind(sock->socketID, (struct sockaddr *) sock->conn, sizeof(*sock->conn)) == -1) {
        printf("Error: Could not bind server: %s. Exiting..\n", strerror(errno));
        perror("Can't bind");
        exit(1);
    }

    return sock;
}


// G_sock* acceptSocketUDP(G_sock* sock){
//     G_sock* client = malloc(sizeof(G_sock));
//     client->socketID = accept(sock->socketID,(struct sockaddr*)sock->conn,sizeof(*sock->conn));
//     client->conn = sock->conn;
//     return client;
// }
void bindSocketUDP(G_sock* sock){
}

void sendSocketUDP(G_sock* sock,G_sock* buff,char* message,int length){
    int result = sendto(sock->socketID,message,length,0,(struct sockaddr*)buff->conn,buff->length);
    if(result < 0){
        sock->hadErr = true;
        if(sock->doErr){
            printf("Error: Could not send to otherSide: %s. Exiting.. result:%i\n", strerror(errno),result);
            perror("Error: Could not send to otherSide.\n");
        }
    }
}

int recvSocketUDP(G_sock* sock,G_sock* buff,char* message,int size){
    int result = recvfrom(sock->socketID,message,size,0,(struct sockaddr*)(buff->conn),&(buff->length));// message get size
    if(result < 0){
        sock->hadErr = true;
        if(sock->doErr){
            printf("Something wrong happened while getting reply from otherSide: %s. result:%i\n", strerror(errno),result);
            perror("Something wrong happened while getting reply from otherSide.\n");
        }
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