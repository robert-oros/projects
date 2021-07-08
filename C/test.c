#include <stdio.h>
#include <string.h>

int main(){
    char* str = "maine ploua mult";

    char first = strtok(*str, " ");
    printf("%s", first);

    char second = strtok(NULL, " ");
    printf("%s", second);

}