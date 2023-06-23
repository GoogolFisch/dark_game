#include"linked.h"

// prints with first element
void printLL(LinkedList* ll){
    LinkedList* cll = ll;
    printf("[");
    while (!(cll->isEnd))
    {
        printf("%i,",cll->value);
        cll = cll->child;

    }
    printf("%i",cll->value);
    printf("]");
}

// append to end
void appendToLL(LinkedList* ll,void* value){
    LinkedList* cll = ll;
    while (!(cll->isEnd))
    {
        cll = cll->child;
    }
    cll->isEnd = false;
    cll->child = malloc(sizeof(LinkedList));
    cll->child->isEnd = true;
    cll->child->value = value;
}

// from index 0
// no negatives, appends after index - (0 is ?) !
void insertInLL(LinkedList *ll, void* value, int index){
    int count = 0;
    LinkedList* cll = ll;
    LinkedList* ell;
    while (!(cll->isEnd) && count < index)
    {
        cll = cll->child;
        count++;
    }
    ell = cll->child;
    cll->child = malloc(sizeof(LinkedList));
    cll->child->child = ell;
    cll->child->isEnd = cll->isEnd;
    cll->child->value = value;
    cll->isEnd = false;
}

// won't pop "your" element
void* popFromLL(LinkedList *ll)
{
    LinkedList* cll = ll;
    if(cll->isEnd){
        return cll->value;
    }
    while (!(cll->child->isEnd))
    {
        cll = cll->child;
    }
    cll->isEnd = true;
    void* v = cll->child->value;
    free(cll->child);
    return v;
}

// Your element contains random as value!
LinkedList* summonLL(){
    LinkedList* ll = malloc(sizeof(LinkedList));
    ll->isEnd = true;
    return ll;
}

// don't use point after!
void freeLL(LinkedList* ll){
    LinkedList* cll = ll;
    LinkedList* ell;
    while (!(cll->isEnd) && cll->child != 0)
    {
        ell = cll->child;
        free(cll);
        cll = ell;
    }
}

// from index 1
// return value of index or last value, no negatives!
void setElementLL(LinkedList* ll,void* value,int index){
    int countIndex = 0;
    LinkedList* cll = ll;
    
    while (!(cll->isEnd) && countIndex < index)
    {
        cll = cll->child;
        countIndex++;
    }

    cll->value = value;
}

// from index 1
// return value of index or last value, no negatives!
void* getElementLL(LinkedList* ll,int index){
    int countIndex = 0;
    LinkedList* cll = ll;
    
    while (!(cll->isEnd) && countIndex < index)
    {
        cll = cll->child;
        countIndex++;
    }

    return cll->value;
}

// return (value of index and remove it) or (last value, but keep it)
// from index 0
void* removefromLL(LinkedList* ll,int index){
    int countIndex = 0;
    void* value = 0;
    LinkedList* cll = ll;
    LinkedList* ell;
    
    if(cll->isEnd){
        return cll->value;
    }
    while (!(cll->child->isEnd) && countIndex < index)
    {
        cll = cll->child;
        countIndex++;
    }
    if(countIndex >= index){
        value = cll->child->value;
        ell = cll->child->child; // no use after free!
        cll->isEnd = cll->child->isEnd;
        free(cll->child);
        cll->child = ell;
        return value;
    }

    return cll->value;
}
// ---- ---- ---- ---- ---- ----

// get LHT with key or NULL
LinkedHashTable* elementGetLHT(LinkedHashTable* lht,int key){
    LinkedHashTable* dlht = lht;
    // liniar search
    // not good for big
    while(!(dlht->isEnd) && key > dlht->key)
    {
        dlht = dlht->child;
    }
    if(key == dlht->key){
        return dlht;
    }
    return 0;
}

// useing elementGetLHT
void* getElementLHT(LinkedHashTable* lht,int key){
    LinkedHashTable* dlht = elementGetLHT(lht,key);
    return dlht->value;
}

void setElementLHT(LinkedHashTable* lht,void* value,int key){
    LinkedHashTable* dlht = elementGetLHT(lht,key);
    dlht->value = value;
}

// Int.MIN is your element
LinkedHashTable* summonLHT(){
    LinkedHashTable* lht = malloc(sizeof(LinkedHashTable));
    lht->isEnd = true;
    lht->key = -2147483648;
    return lht;
}

// insert or set value
void insertInLHT(LinkedHashTable* lht,void* value,int key){
    LinkedHashTable* dlht = lht;
    LinkedHashTable* nlht;
    // liniar search
    // not good for big
    while(!(dlht->isEnd) && key > dlht->child->key)
    {
        dlht = dlht->child;
    }
    if(dlht->child->key != key){
        nlht = malloc(sizeof(LinkedHashTable));
        nlht->isEnd = dlht->isEnd;
        dlht->isEnd = false;
        nlht->child = dlht->child;
        dlht->child = nlht;
        nlht->key   = key;
    }
    nlht->value = value;
}

void* removeFromLHT(LinkedHashTable* lht,int key){
    LinkedHashTable* dlht = lht;
    // liniar search
    // not good for big
    while(!(dlht->isEnd) && key < dlht->child->key)
    {
        dlht = dlht->child;
    }
}

// don't use point after!
void freeLHT(LinkedHashTable* lht){
    LinkedHashTable* clht = lht;
    LinkedHashTable* elht;
    while (!(clht->isEnd) && clht->child != 0)
    {
        elht = clht->child;
        free(clht);
        clht = elht;
    }
}

//
void printLHT(LinkedHashTable* lht){

    LinkedHashTable* clht = lht;
    printf("[");
    while (!(clht->isEnd))
    {
        printf("%i=%i,",clht->key,clht->value);
        clht = clht->child;

    }
    printf("%i=%i",clht->key,clht->value);
    printf("]");
}
