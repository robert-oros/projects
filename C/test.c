#include <stdio.h>


int help(){
    printf("%s", "Help Function");
}

int main(int argc, char *argv[]){
    for(int i=1; i<argc; i++){

        if(strcmp(argv[i], "-h") == 0 ){
            help();
        } 
    }
    
}