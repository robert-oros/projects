#include <stdio.h> 
#include <string.h> 

int convertToF(int clersius){
   return (clersius*9/5)+32;
}

int main(){   
   printf("%d\n", convertToF(17));
}