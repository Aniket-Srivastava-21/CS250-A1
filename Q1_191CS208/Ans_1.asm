# Program to return favourite number
.data

msg: .string "My favourite number is: "

.text

main:
	la a0, msg	
	li a7, 4		# print the message
	ecall
	li a0, 2109	# load my favourite number to register
	li a7, 1
	ecall		# system call to print it
	li a7, 10
	ecall		# exit the program
