# Program to convert 2-digit number to its equivalent ASCII string

.data
.string 
str: "Enter the decimal integer: "
str1: "The base address of string: "
a: ""

.text
main:
	la a0 , str
  	li a7 , 4           	# print str
  	ecall
	li a7, 5		# take input from user
	ecall
	li a1, 10		
	la a3, a		# load address of a
	j print_int

print_int:
	rem a2, a0, a1		# a2 = n%10
	div a4, a0, a1		# a4 = n/10
	addi a2, a2, 48		# increasing their values by 48
	addi a4, a4, 48
	sb a4, 0(a3)		# storing them in memory 
	sb a2, 1(a3)
	sb x0, 2(a3)
	la a0 , str1
  	li a7 , 4           	# print str1
  	ecall
	la a0, a		# print the address
	li a7, 34
	ecall
	li a7, 10		# exit the program
	ecall
	
