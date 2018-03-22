#include <stdio.h>

void swap(int &c, int &d)
{
	printf("c = %0.16X \n", &c);
	printf("d = %0.16X \n", &d);
	int temp =c;
	c = d;
	d = temp;
	
}
int main()
{
	int a, b;
	a =5;
	b = 10;
	swap(a,b);
	printf("a = %0.8X \n", a);
        printf("b = %0.8X \n", b);


	return 0;
}
