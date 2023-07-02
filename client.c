#define SDL_MAIN_HANDLED

#include<windows.h>
#include "lib/linked.h"
#include "include.h"
#include <SDL2/SDL.h>
// #pragma comment(lib, "opengl32")
// #pragma comment(lib, "glu32")
// #include <gl/gl.h>
// #include <gl/glu.h>
// #include "lib/c_socket.h"

struct Game{
    int num;
    bool stop;
    // struct LinkedList* ll;
    // struct LinkedHashTable* lht;
    // struct LinkedHashTable* tokens;
    // struct LinkedHashTable* var;
    // G_sock* server;
    SDL_Renderer *renderer;
    SDL_Window *window;
};

void endClient(struct Game* game);
void draw(struct Game* game);
void doInput(struct Game* game);
void startClient(struct Game* game);

int main(int argc, char *argv[]){
    struct Game* g = malloc(sizeof(struct Game));
    g->stop = false;
    startClient(g);
    while(!(g->stop)){
        doInput(g);
        draw(g);
        SDL_RenderPresent(g->renderer);
        SDL_Delay(10);
    }
    endClient(g);
    free(g);
    return 0;
}
void startClient(struct Game* game){
    //sockaddr_in
    // int carryCheck = 0;
    // char chptr[64];
    // game->server = summonSocketUDP(127,0,0,1);

    // // connectSocketUDP(g);
    // strcpy(chptr,"hello from c client!\0");
    // sendSocketUDP(game->server,chptr,21);
    // recvSocketUDP(game->server,chptr,64);
    // printf("%s\n",chptr);
    int rendererFlags, windowFlags;
    rendererFlags = SDL_RENDERER_ACCELERATED;
    windowFlags = 0;
    if(SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        printf("Couldn't initialize SDL: %s\n", SDL_GetError());
		exit(1);
    }
    game->window = SDL_CreateWindow("Hello",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,400,300,windowFlags);
    if(!game->window){
		printf("Failed to open %d x %d window: %s\n", 400, 300, SDL_GetError());
		exit(1);
    }

    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY,"linear");

    game->renderer = SDL_CreateRenderer(game->window,-1,rendererFlags);

    if(!game->renderer){
		printf("Failed to create renderer: %s\n", SDL_GetError());
		exit(1);
    }
}

void doInput(struct Game* game){
    SDL_Event event;
    while(SDL_PollEvent(&event)){
        switch (event.type)
        {
        case SDL_QUIT:
            game->stop = true;
            break;
        default:
            break;
        }
    }
}

void draw(struct Game* game){
    SDL_SetRenderDrawColor(game->renderer,64,128,255,255); // render, r,g,b,a
    SDL_RenderClear(game->renderer);
}

void endClient(struct Game* game){
    // closeSocketUDP(game->server);
}