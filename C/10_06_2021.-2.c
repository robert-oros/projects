#include <stdio.h>

int count=1;

int check_stack_frame(){
    int start[] = {55555555};
    int *s=start;

    for(int i=0; i<500; i++){
        printf("%d %d\n", s++, s[i]);
    }
}

int recursiveFunc(){
    printf("recursiveFunc() +%d\n", count);

    while (count++ < 5){
        recursiveFunc();

        if ((count++)-1 == 5){ 
            printf("check_stack_frame()\n"), check_stack_frame(); 
        }
        break;
    }

  
}

int main(){    
    recursiveFunc();
}