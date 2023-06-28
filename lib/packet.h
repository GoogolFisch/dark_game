#ifndef PACKET_H_
#define PACKET_H_
#include"../include.h"

enum Packet{
    PING,
    CJoinRequest,
    SAccept
};

typedef struct GetPacket {
    enum Packet packetType;
    int length;
    char* chptr;
} GetPacket;

// Packet-from(c,s)-What{stats};

// ---- ---- bothStream ---- ----

// Client ask for Ping w. cTime -> Server gives ping w. sTime
struct PacketPing{
    long timeStamp;
};

// ---- ---- upStream ---- ----

// client starts connection
// also 2nd package(for rename)
struct PacketCJoinRequest{
    int nameLength;
    char name[16];
};

// onSomeTick || onMove || onLook
struct PacketCPos{
    double posX,posY,posZ;
    double velX,velY,velZ;
    double dirYaw,dirPitch;
    bool iFront,iBack,iLeft,iRight,iJump; // no override
    bool onGround;
};

// for control - no loss!
struct PacketCGotMessage{
    enum Packet packetType;
    int code;
};

// ---- ---- downStream ---- ----

//
struct PacketSAccept{
    long long key;
    long long mod;
    long uuid;
};

// onDesync(detect) || tp
struct PacketSPos{
    double posX,posY,posZ;
    double dirYaw,dirPitch;
};

#endif