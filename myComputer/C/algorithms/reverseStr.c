#include <stdio.h>


int main(void){
   char mystrg[60];

   printf("Please insert the string you want to reverse: ");
   scanf("%s", mystrg);

   int leng = strlen(mystrg);

   for(int i = leng - 1; i >= 0; i--) {
      printf("%c", mystrg[i]);
   }
}