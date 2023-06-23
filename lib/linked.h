#ifndef LINKED_H_
#define LINKED_H_

#include "../include.h"

typedef struct LinkedList{
    // Warn index 0 is "funny"
    struct LinkedList* child;
    bool isEnd;
    void* value;
} LinkedList;

typedef struct LinkedHashTable{
    // Warn index 0 is "funny"
    struct LinkedHashTable* child;
    bool isEnd;
    int key;
    void* value;
} LinkedHashTable;

// ---- ---- ---- ---- LL
LinkedList* summonLL    ();
void        printLL     (LinkedList* ll                      );
void        freeLL      (LinkedList* ll                      );
void        appendToLL  (LinkedList* ll,void* value          );
void        insertInLL  (LinkedList* ll,void* value,int index);
void        setElementLL(LinkedList* ll,void* value,int index);
void*       getElementLL(LinkedList* ll,int index            );
void*       removefromLL(LinkedList* ll,int index            );
void*       popFromLL   (LinkedList* ll                      );
// ---- ---- ---- ---- LHT
LinkedHashTable* summonLHT    ();
void             freeLHT      (LinkedHashTable* lht                    );
void             insertInLHT  (LinkedHashTable* lht,void* value,int key);
void             setElementLHT(LinkedHashTable* lht,void* value,int key);
void*            getElementLHT(LinkedHashTable* lht,int key            );
LinkedHashTable* elementGetLHT(LinkedHashTable* lht,int key            );
void*            removeFromLHT(LinkedHashTable* lht,int key            );
void             printLHT     (LinkedHashTable* lht                    );
// ---- ---- ---- ---- implementations
// ---- ---- ---- ---- LL
// ---- ---- ---- ---- LHT

#endif