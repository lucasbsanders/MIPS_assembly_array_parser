# project1_MIPS

MIPS (a RISC instruction set architecture/assembly code) code made for CDA3101 at UF

Simulates the following pseudocode:


int A[18] = {89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73};

int B[11] = {0,0,0,0,0,0,0,0,0,0,0};

int C[7] = {0,0,0,0,0,0,0};

int min = 100;

int minIndex = 0;

int i=0,j=0,k=0;

/*find the index of the smallest positive number in the array*/

for (i = 0; i < 18; i++) {

if( A[i] < min && A[i]>0 ) {

min = A[i];

minIndex = i;

}

}

printf("Index of the smallest positive number: %d\n", minIndex);

/*Transfer all positive numbers to array B and all negative numbers to array C*/

j=0;

k=0;

for (i = 0; i < 18; i++) {

if( A[i] > 0 ){

B[j] = A[i];

j++;

}

else{

C[k] = A[i];

k++;

}

}

printf("Array B:");

for (i = 0; i < 11; i++)

printf(" %d",B[i]);

printf("\n");

printf("Array C:");

for (i = 0; i < 7; i++)

printf(" %d",C[i]);

printf("\n");
