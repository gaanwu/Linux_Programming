#include <stdio.h>
#include <stdbool.h>

int sum(int n);
void main()
{
 int n;
 bool bo = true;
 printf("bool bo = %X \n", bo);
 printf("Input the number n: \n");
 scanf("%d",&n);
 printf("1*2+2*3+3*4+...+(n-1)*n=%d\n", sum(n));
 
}

int sum(int n)
{
 if (n == 1) 
         return 0;
 else
         return sum(n-1)+n*(n-1);
}
