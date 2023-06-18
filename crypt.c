#include "crypt.h"

long memRandom(){
    long *thing;
    long outp;
    thing = malloc(RANDOM_SIZE * sizeof(long));
    for (int x=0;x<RANDOM_SIZE;x++){
        outp = setrand(outp ^ thing[x]);
    }
    free(thing);
    return outp;
}

long setrand(long seed){
    return seed * 5 ^ (seed >> 1);
}

// pointer is yours!
MessageConPrivate* createPrivateKey(int limit){
    MessageConPrivate* priv = malloc(sizeof(MessageConPrivate));
    priv->limit = limit;
    priv->invers = (int)memRandom();
    
    // may take an while!
    int curr = 0;
    int prev = priv->invers;
    for(int counter = 0;counter < limit;counter++){
        curr = (prev * priv->invers) % limit;
        if (curr == 1){
            priv->factor = prev;
            break;
        }
        prev = curr;
    }
    return priv;
}
// pointer is yours!()
MessageConPublic*  privateGenPublic(MessageConPrivate* priv,int scaleFac,int scaleMod){
    MessageConPublic* pub = malloc(sizeof(MessageConPublic));
    pub->limit  =  priv->limit  * scaleMod;
    pub->factor = (priv->factor + scaleFac * priv->limit) % pub->limit;
    return pub;
}

// pointer is yours!(mab from server/client)
MessageConPublic*  createPublicKey (long long fac,long long mod){
    MessageConPublic* pub = malloc(sizeof(MessageConPublic));
    pub->factor = fac;
    pub->limit  = mod;
    return pub;
}

long long encriptMessage(MessageConPublic*  pub,int       message){
    return (((long long)message) * pub->factor) % pub->limit;
}
int       decriptMessage(MessageConPrivate* priv,long long message){
    return ((int)(message % (long long)priv->limit) * priv->invers % priv->limit);
}