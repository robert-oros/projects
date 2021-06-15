#include <stdio.h> 
#include <string.h> 

int main(){
   char str[50] = "Today is a good day";
   int max = 0;

   char* token = strtok(str, " ");

   while(token != NULL){
      int lengthStr = strlen(token);

      if(lengthStr > max){
         max = lengthStr;

         //printf("Longest word in string is: %s%s%d\n", token," ",  max);
      }
      token = strtok(NULL, " ");
      
   }
}
