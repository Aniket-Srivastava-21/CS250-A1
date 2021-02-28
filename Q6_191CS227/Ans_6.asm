.data

msg: .string "Sum of positive integers till "	# store necessary messages
msg1: " is: " 

.text

main:
	li a0, 10		# store n in the register
	j N_Sum			# call the function

N_Sum:
	addi a1, a0, 0		
	li a2, 1		# initialize the iterators
	li a3, 0
Loop:	bgt  a2, a1, Done	# while ( i <= n )
	add a3, a3, a2
	addi a2, a2, 1		# addition
	j Loop 	

Done:
	la a0, msg	
	li a7, 4		# print the message
	ecall
	li a0, 10		# print n
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
