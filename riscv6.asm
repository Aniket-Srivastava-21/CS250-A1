.data
             a:                 # address to store digits

.text

main:
	li a0, 11          # N=11
	li s1 , 10
	j N_Sum
	

N_Sum:
	addi a1, a0, 0
	li a2, 1
	li a3, 0
	
Loop:	bgt  a2, a1, print_int          # sum the N natural number
	add a3, a3, a2
	addi a2, a2, 1
	j Loop 
	
print_int:
	la a5 , a
	rem a2, a3, s1                  # remender of 2 digit no after dividing by 10
	div a4, a3, s1                  # 10th place digit
	addi a2, a2, 48 
	addi a4, a4, 48
	sb a4, 0(a5)
	sb a2, 1(a5)
	la a0, a
	li a7, 4
	ecall	

Done:

	li a7, 10
	ecall
