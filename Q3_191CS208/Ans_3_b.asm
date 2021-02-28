# Program to Find sum of first n positive integers ( n taken as user input )
.data

.string
msg: "Enter the value of n: "
msg0: "Sum of first "	# store necessary messages
msg1: " positive integers is: " 

.text

main:
	la a0, msg	
	li a7, 4		# print the message
	ecall
	li a7, 5		# take n as input from user
	ecall
	addi a4, a0, 0
	j N_Sum			# call the function

N_Sum:
	addi a1, a4, 0		
	li a2, 1		# initialize the iterators
	li a3, 0
Loop:	bgt  a2, a1, Done	# while ( i <= n )
	add a3, a3, a2
	addi a2, a2, 1		# addition
	j Loop 	

Done:
	la a0, msg0	
	li a7, 4		# print the message0
	ecall
	li a0, 0		# print n
	addi a0, a4, 0
	li, a7, 1
	ecall
	la a0, msg1	
	li a7, 4		# print the message1
	ecall
	li a0, 0
	addi a0, a3, 0		# print the result
	li a7, 1
	ecall
	li a7, 10		# exit the program
	ecall
