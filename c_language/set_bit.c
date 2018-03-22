#include <stdio.h>

#define TRUE	1
#define FALSE	0
#define BOOL	int

void main()
{
	int abc=0xABCD;
	printf("Get_Bit7_of_Input %d \n",Get_Bit7_of_Input(abc));
	Set_Bit5_of_Input(abc);
	Clear_Bit_of_Input(abc);
	
}

BOOL Get_Bit7_of_Input(int in)
{
	if ( in & 0x00000080)
		return TRUE;
	else 
		return FALSE;
}

void Set_Bit5_of_Input(int * in)
{
	printf("in= %x \n", in);
}

void Clear_Bit_of_Input(int * in, int bit)
{
	int i;
	printf("in= %x \n", in);
	for( i=0;i<bit;i++)
	{
		
	}

}

