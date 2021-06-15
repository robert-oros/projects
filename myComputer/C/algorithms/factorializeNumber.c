#include <stdio.h> 
#include <string.h> 

int factorialize(int n){
   int total = 1;

   for(int i=1; i<=n; i++){
      total = total*i;
   }

   printf("%d\n", total);
}

int main(){
   factorialize(5);
}