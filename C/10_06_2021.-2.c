#include <stdio.h>

// Create a recursive function that is called 5 times, and then call another function 
// that goes on the stack and print from which adrress to which adrress is each frame.

int check_stack_frame(char func_name[], int rsp, int rbp){
    printf("%s \n    start frame-> %ld\n    end frame-> %ld\n",func_name, &rbp, &rsp);
}

int count=1;
int recursive_func(){
    int rsp asm("rsp");
    int rbp asm("rbp");

    while (count++ < 5){
        recursive_func();

        if ((count++)-1 == 5){
            check_stack_frame("recursive_func()",rsp, rbp); 
        }
        break;
    }  
}

int main(){    
    int rsp asm("rsp");
    int rbp asm("rbp");

    check_stack_frame("main()",rsp, rbp);

    recursive_func();
}