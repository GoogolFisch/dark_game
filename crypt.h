#ifndef CRYPT_H_
#define CRYPT_H_

#include "include.h"

#define RANDOM_SIZE 4

typedef struct MessageConPublic
{
    long long limit;
    long long factor;
} MessageConPublic;

typedef struct MessageConPrivate
{
    long limit;
    long factor;
    long invers;
} MessageConPrivate;

MessageConPrivate* createPrivateKey(int limit);
MessageConPublic*  privateGenPublic(MessageConPrivate* priv,int scaleFac,int scaleMod);

MessageConPublic*  createPublicKey (long long fac,long long mod);

long long encriptMessage(MessageConPublic*  pub,int       message);
int       decriptMessage(MessageConPrivate* pub,long long message);

long memRandom();
long setrand(long seed);

#endif