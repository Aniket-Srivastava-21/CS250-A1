.text

main:
	li a1, 96
	li a2, 132
	j GCD
	
GCD:
	li a3, 2
	div a4, a1, a3
LOOP:	
	blt a4, a3, DONE
	rem a5, a1, a4
	rem a6, a2, a4
	beqz a5, CHECK
	addi a4, a4, -1
	j LOOP
CHECK:	
	beqz a6, DONE
	addi a4, a4, -1
	j LOOP

DONE:
	li a7, 1
	addi a0, a4, 0
	ecall
	li a7, 10
	ecall
	 