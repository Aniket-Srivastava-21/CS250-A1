.text

main:
	li a0, 10
	j N_Sum

N_Sum:
	addi a1, a0, 0
	li a2, 1
	li a3, 0
Loop:	bgt  a2, a1, Done
	add a3, a3, a2
	addi a2, a2, 1
	j Loop 	

Done:
	li a0, 0
	addi a0, a3, 0
	li a7, 1
	ecall
	li a7, 10
	ecall