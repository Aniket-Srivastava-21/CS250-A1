# Sorting an array using your favourite algorithm (insertion sort)

.data
str: 
	.string "  "
message:			# store necessary strings
	"Sorted array is: "
a:
	.word 5, 3, 2, 1, 4	# input array is {5, 3, 2, 1, 4}

.text
main:
	la a1, a		# load address of array
	li a3, 1		# initialize iterators
	li a4, 5
LOOP1:				# for( i = 1; i < n; i++ )
	beq a3, a4, PRINT	
	slli t1, a3, 2		
	add t1, a1, t1		# s1 = a[i]
	lw s1, 0(t1)
	addi a5, a3, -1
LOOP2:				# for( j = i - 1; j >= 0; j-- )
	bltz a5, END1
	slli t0, a5, 2
	add t0, a1, t0		# s0 = a[j]
	lw s0, 0(t0)
	bge  s1, s0, END2	# if (a[i] < a[j])
	sw s0, 0(t1)
	addi t1, t0, 0		# swap and store a[i] and a[j]
	sw s1, 0(t0)
END2:   
	addi a5, a5, -1
	j LOOP2
END1:	
	addi a3, a3, 1
	j LOOP1
PRINT:
	li a3, 0
	la a0, message		# print message
	li a7, 4
	ecall
LOOP:
	beq a3, a4, DONE
	slli t1, a3, 2
	add t1, a1, t1
	lw s1, 0(t1)
	addi a0, s1, 0
	li a7, 1
	ecall			# print the sorted array with spaces
	la a0, str
	li a7, 4
	ecall
	li a0, 0
	addi a3, a3, 1
	j LOOP
DONE:
	li a7, 10		# exit program
	ecall
