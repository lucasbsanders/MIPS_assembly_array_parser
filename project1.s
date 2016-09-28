# On my honor, I have neither given nor received unauthorized aid on this assignment

# Project 1 - CDA3101
# Lucas Sanders

.data
A: .word 89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73		#load array A with values: int A[18] = {89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73};
B: .word 0,0,0,0,0,0,0,0,0,0,0		#load array B with values: int B[11] = {0,0,0,0,0,0,0,0,0,0,0};
C: .word 0,0,0,0,0,0,0 		#load array C with values: int C[7] = {0,0,0,0,0,0,0};

.text
.globl main
main:
	la $s0,A		#load register s0 with address of array A
	la $s1,B		#load register s1 with address of array B
	la $s2,C		#load register s2 with address of array C
	
	li t0,100 		#load t0 with min = 100;
	li t1,$0 		#load t1 with minIndex = 0;
	li t2,$0		#load t2 with value i=0 
	li t3,$0		#load t3 with value j=0 
	li t4,$0		#load t4 with value k=0
	
#/*find the index of the smallest positive number in the array*/
	
LOOP_0		#for (i = 0; i < 18; i++) {
	li t2,$0		#t2 is i, used as an iterator for this loop
	s1 NEQ LOOP_0		#if( A[i] < min && A[i]>0 ) {
	lw t0,t2(s0)		#min = A[i];
	li s5,t2		#minIndex = i;
	
IF_1		#skip to here if the if statement fails

	
	slti $t6,$t5,18 	#set t6 = 1 if t5 is less than 18
	li $t7,1		#load t7 with the value 1
	beq $t7,$t6,LOOP_0		#if t6 is 1, then loop back to the start of the for loop
	
la $a0,	#printf("Index of the smallest positive number: %d\n", minIndex);




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
