# Program to find gcd of two numbers

.data
.string
msg1: "\nThe GCD of "
msg2: " and "
msg3: " is: "

.text

main:
	li a1, 96	# load the numbers in registers
	li a2, 132
	j GCD
	
GCD:
	li a3, 2	# i = 2, j = n/2
	div a4, a1, a3	
LOOP:				# for( i = 2; j >= i; j--) 
	blt a4, a3, DONE
	rem a5, a1, a4		# k = n % j
	rem a6, a2, a4		# l = m % j
	beqz a5, CHECK		# if( n == 0 )
	addi a4, a4, -1		# else j--
	j LOOP
CHECK:				# if( n == 0 )
	beqz a6, DONE		# if( m == 0 ) break
	addi a4, a4, -1		# else j--
	j LOOP

DONE:
	la a0, msg1	
	li a7, 4		# print the message1
	ecall
	li a0, 0
	li a7, 1		# print n
	addi a0, a1, 0
	ecall
	la a0, msg2
	li a7, 4		# print the message2
	ecall
	li a0, 0
	li a7, 1		# print m
	addi a0, a2, 0
	ecall
	la a0, msg3	
	li a7, 4		# print the message3
	ecall
	li a0, 0
	li a7, 1		# print result
	addi a0, a4, 0
	ecall
	li a7, 10		# exit the program
	ecall
	 
