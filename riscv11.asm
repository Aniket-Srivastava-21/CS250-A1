.data
str: 
	.string "  "
message:
	"Sorted array is: "
a:
	.word 5

.text
main:
	la a1, a
	li a2, 3
	sw a2, 4(a1)
	li a2, 2
	sw a2, 8(a1)
	li a2, 1		#input array is {5, 3, 2, 1, 4}
	sw a2, 12(a1)
	li a2, 4
	sw a2, 16(a1)
	li a3, 1
	li a4, 5
LOOP1:
	beq a3, a4, PRINT
	slli t1, a3, 2
	add t1, a1, t1
	lw s1, 0(t1)
	addi a5, a3, -1
LOOP2:
	bltz a5, END1
	slli t0, a5, 2
	add t0, a1, t0
	lw s0, 0(t0)
	bge  s1, s0, END2
	#add s1, s1, s0
	#sub s0, s1, s0
	#sub s1, s1, s0
	sw s0, 0(t1)
	addi t1, t0, 0
	sw s1, 0(t0)
END2:   
	addi a5, a5, -1
	j LOOP2
END1:	
	addi a3, a3, 1
	j LOOP1
PRINT:
	li a3, 0
	la a0, message
	li a7, 4
	ecall
LOOP:
	beq a3, a4, DONE
	slli t1, a3, 2
	add t1, a1, t1
	lw s1, 0(t1)
	addi a0, s1, 0
	li a7, 1
	ecall
	la a0, str
	li a7, 4
	ecall
	li a0, 0
	addi a3, a3, 1
	j LOOP
DONE:
	li a7, 10
	ecall
