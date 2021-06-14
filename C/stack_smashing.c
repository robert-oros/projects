#include <stdio.h>

void smash(){
    int c[] = {1,2,3,4};
    int *p = c;
    
    printf(" ADRESA    VALUE\n");
    for(int i=0; i<34; i++){
        printf("%ld %d\n",p++, *p);
    }
    
}

int main(){
    int b[]={120,150,152};
    int *d=b;

    smash();
}