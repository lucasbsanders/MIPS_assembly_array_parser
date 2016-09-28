# On my honor, I have neither given nor received unauthorized aid on this assignment
# Project 1 - CDA3101
# Lucas Sanders

#data section
.data
.align 0
A: .word 89,19,91,-5,23,-67,31,46,-71,-14,-10,3,67,17,11,-18,43,-73		#load array A with its values
B: .word 0,0,0,0,0,0,0,0,0,0,0		#load array B with its values
C: .word 0,0,0,0,0,0,0 		#load array C with its values
msg0:	.asciiz "Index of the smallest positive number: %d\n""
msg1:	.asciiz "Array B:"
msg2:	.asciiz "Array C:"
msg3:	.asciiz " %d"
msg4:	.asciiz "\n"

.text
.align 2
.globl main
main:
	la $s0,A		#load register s0 with address of array A
	la $s1,B		#load register s1 with address of array B
	la $s2,C		#load register s2 with address of array C
	
	li $t0,100 		#load t0 with min = 100;
	li $t1,$0 		#load t1 with minIndex = 0;
	li $t2,$0		#load t2 with value i=0 
	li $t3,$0		#load t3 with value j=0 
	li $t4,$0		#load t4 with value k=0
				#t5,t6,t7 are used intermittedly within the program
	
#/*find the index of the smallest positive number in the array*/
	
	li $t2,$0		#set t2 to 0. t2 is i, used as an iterator for this loop
LOOP_0				#for (i = 0; i < 18; i++)

	lw $t5,$t2($s0)		#load a temporary value (t5) with A[i]
	slt $t6,$t5,$t0		#load a temporary value (t6) with 1 if A[i] is less than min
	slti $t5,$t5,$0		#load a temporary value (t5) with 1 if A[i] is greater than 0
	and $t5,$t5,$t6		#AND value (t5) with the result of the two previous boolean statements
	bne $t5,$1,IF_1		#skip the steps in the if statement if t5 (boolean within if statement) is not equal to one
				#if( A[i] < min && A[i]>0 )
	lw $t0,$t2($s0)		#sets min equal to A[i];
	li $t1,$t2		#sets minIndex equal to i;
IF_1				#skip to here if the if statement fails

	addi $t2,1		#iterate (i plus 1)
	slti $t6,$t2,18 	#set temp value t6 to 1, if i is less than 18
	beq $1,$t6,LOOP_0		#if t6 is 1, then loop back to the start of LOOP_0
	
	la $a0,msg0		#print the following: ("Index of the smallest positive number: %d\n", minIndex)
	mov $a1,$t1		#insert the minIndex into the printed statement
	jal printf
	
#/*Transfer all positive numbers to array B and all negative numbers to array C*/

	li $t3,$0		#load t3 with value j=0 
	li $t4,$0		#load t4 with value k=0
	li $t2,$0		#t2 is i, used as an iterator for this loop
LOOP_1				#for (i = 0; i < 18; i++)
	lw $t5,$t2($s0)		#load a temporary value (t5) with A[i]
	slti $t5,$t5,$0		#load a temporary value (t5) with 1 if A[i] is greater than 0
	bne $t5,$1,IF_2		#skip the steps in the "if" statement if t5 (boolean within if statement) is not equal to one
				#if( A[i] > 0 )
	lw $t5,$t2($s0)		#load a temporary value (t5) with A[i]
	sw $t5,$t3($s1)		#sets B[j] equal to A[i];
	addi $t3,1		#iterate (j plus 1)
	
IF_2				#else statement
	lw $t5,$t2($s0)		#load a temporary value (t5) with A[i]
	sw $t5,$t4($s2)		#sets C[k] equal to A[i];
	addi $t4,1		#iterate (k plus 1)

	addi $t2,1		#iterate (i plus 1)
	slti $t6,$t2,18 	#set t6 equal to 1 if i is less than 18
	beq $1,$t6,LOOP_1		#if t6 is 1, then loop back to the start of LOOP_1
	
	la $a0, msg1		#print the following: ("Array B:")
	jal printf
	
	li $t2,$0		#t2 is i, used as an iterator for this loop
LOOP_2			 	#for (i = 0; i < 11; i++){
	lw $t5,$t2($s1)		#load a temporary value (t5) with B[i]
	la $a0,msg3		#print the following: (" %d", B[i])
	mov $a1,$t5		#insert that temporary value into the print statement
	jal printf
	
	addi $t2,1		#iterate (i plus 1)
	slti $t6,$t2,11 	#set t6 equal to 1 if i is less than 11
	beq $1,$t6,LOOP_2		#if t6 is 1, then loop back to the start of LOOP_2
	
	la $a0, msg4            #print the following: ("\n:")
	jal printf
	
	la $a0, msg2            #print the following: ("Array C:")
	jal printf
	
	li $t2,$0		#t2 is i, used as an iterator for this loop
LOOP_3			 	#for (i = 0; i < 7; i++)
	lw $t5,$t2($s2)		#load a temporary value (t5) with C[i]
	la $a0,msg3		#print the following: (" %d", C[i])
	mov $a1,$t5		#insert that temporary value into the print statement
	jal printf
	
	addi $t2,1		#iterate (i plus 1)
	slti $t6,$t2,7 		#set t6 equal to 1 if i is less than 7
	beq $1,$t6,LOOP_2		#if t6 is 1, then loop back to the start of LOOP_3 

	la $a0, msg4		#print the following: ("\n:")
	jal printf
	
	li $t2,$0		#load t2 with value i=0 
	
exit:
    	li $v0,10
    	syscall             # exit

