#include <stdio.h>

int firfunct(){
    int c[] = {55555};
    int *p = c;

    int first_address=p;
    int last_address=0;

    for(int i=0; i<100; i++){
        printf("%d %d\n", p++,p[i]);
        if(p[i] == 555551){
            last_address=(p++)-1;
            break;
        }
    }


    printf("first address = %d; last_address=%d", first_address, last_address);

}

int main(){
    int c = {555551};
    int *p = c;
    firfunct();
}