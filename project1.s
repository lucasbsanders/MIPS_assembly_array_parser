# On my honor, I have neither given nor received unauthorized aid on this assignment

# Project 1 - CDA3101
# Lucas Sanders

s1  	#int A[18] = {89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73};
s2  	#int B[11] = {0,0,0,0,0,0,0,0,0,0,0};
s3  	#int C[7] = {0,0,0,0,0,0,0};
ls s4, $64 	#int min = 100;
ls s5, 0  	#int minIndex = 0;
s6
s7
s8  	#int i=0,j=0,k=0;
	#/*find the index of the smallest positive number in the array*/
LOOP	#for (i = 0; i < 18; i++) {
s1 NEQ LOOP	#if( A[i] < min && A[i]>0 ) {
s4 = s1,i	#min = A[i];
s5 = i	#minIndex = i;
	#}
i EQ LOOP	#}
print???	#printf("Index of the smallest positive number: %d\n", minIndex);
	#/*Transfer all positive numbers to array B and all negative numbers to array C*/
s7	#j=0;
s8	#k=0;
LOOP_1 i EQ	#for (i = 0; i < 18; i++) {
s1 NEQ LOOP_2	#if( A[i] > 0 ){
s2 = s1	#B[j] = A[i];
s7 add1	#j++;
s1 EQ LOOP_1	#}
LOOP_2	#else{
s3 = s1	#C[k] = A[i];
s8 add1	#k++;
	#}
i NEQ LOOP_1	#}
print???	#printf("Array B:");
LOOP_2 i NEQ 	#for (i = 0; i < 11; i++){
print???	#printf(" %d",B[i]);
i EQ LOOP_2  }
print??	#printf("\n");
print??	#printf("Array C:");
LOOP_3 i EQ	#for (i = 0; i < 7; i++){
print????	#printf(" %d",C[i]);
i NEQ LOOP_3  }
print???????	#printf("\n");
DONE EQ DONE
DONE NEQ DONE
