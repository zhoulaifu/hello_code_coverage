#include <stdio.h>

//code copied from somewhere
int greatest_of_three(int a,int b,int c){
  if((a>b) && (a>c)){    //for a > b and a>c case
    return a;
   }
   else if(b>c){    //for b>c case
    return b;
   }
  else{
    return c;
  }
 return 0;
}

int main(){
  int result=greatest_of_three(1,2,3);
  printf ("result = %d\n", result);
  if (result==3) return 0; else return 1;

}
