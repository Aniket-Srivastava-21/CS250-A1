.data
.string 
str: "Enter the decimal integer: "
str1: "The string integer: "

.word
a: 0

.text
main:
	la a0 , str
  	li a7 , 4           # print str
  	ecall
	li a7, 5
	ecall
	li a1, 10
	la a3, a
	j print_int

print_int:
	rem a2, a0, a1
	div a4, a0, a1
	addi a2, a2, 48
	addi a4, a4, 48
	sb a4, 0(a3)
	sb a2, 1(a3)
	la a0 , str1
  	li a7 , 4           # print str1
  	ecall
	la a0, a
	li a7, 4
	ecall
	li a7, 10
	ecall
	
