#include <stdio.h> 
#include <string.h> 

int main(){
   int i,j;
   int arr[4][4] = {
      {4, 5, 1, 3}, {13, 27, 18, 26}, {32, 35, 37, 39}, {1000, 1001, 857, 1}
   };

   for (i = 0; i < 4; i++) {
      int largestNum = arr[i][0];
      for (j = 0; j < 4; j++) {
         if(arr[i][j] > largestNum){
            printf("%d\n",arr[i][j]);
         }
      }
   }
}
