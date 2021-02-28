.data

.string 
message1: "The given element is found at "
message2: " postion\n"
message3: "Given element not found!"

.word
arr: 2

.text
main:
	la a1, arr
	li a2, 4
	sw a2, 4(a1)
	li a2, 7
	sw a2, 8(a1)
	li a2, 10		#input array is {2, 4, 7, 10, 15}
	sw a2, 12(a1)
	li a2, 15
	sw a2, 16(a1)
	li a6, 4
	li a3, 0
	li a4, 4
LOOP:
	bgt a3, a4, UNSUC
	add a5, a3, a4
	srli a5, a5, 1
	slli s0, a5, 2
	add a2, a1, s0
	lw s1, 0(a2)
	blt a6, s1, CASE1
	bgt a6, s1, CASE2
	la a0, message1
	li a7, 4
	ecall
	li a0, 0
	addi a0, a5, 1
	li a7, 1
	ecall
	la a0, message2
	li a7, 4
	ecall
	j SUC
CASE1:
	addi a4, a5, -1
	j LOOP
CASE2:
	addi a3, a5, 1
	j LOOP
UNSUC:
	la a0, message3
	li a7, 4
	ecall
SUC:
	li a7, 10
	ecall


	
	
	
	
	
	