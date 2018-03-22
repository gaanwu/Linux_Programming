#include <stdio.h>

int fun(int i , int j)
{
	return i*j;

}

int s(int n)
{
	int i;
	int sum =0;
	for (i = 2; i<= n ; i++)
		sum += ((i-1)*(i));
	return sum;
}

void main()
{
	int n;
	int k=20;
	int sum=0;
	for(n=2;n<=k;++n)
	{
		sum+=fun(n-1, n);
	}
	printf("js %d \n", sum);
	printf("web %d \n", s(20));
}	
