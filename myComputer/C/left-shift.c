#include <stdio.h> 
#include <string.h> 

int main(){
    int x = 16;
                                                             //    16           4
    int result = x<<4; // left-shift adauga 4 zerouri la 16; // 1 0 0 0 0 << 0 0 0 0
    printf("%d \n", result);

    return 0;
}