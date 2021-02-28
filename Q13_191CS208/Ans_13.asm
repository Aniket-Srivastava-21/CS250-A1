# Program to perform binary search

.data

.string 
message0: "\nEnter the number to be found: "
message1: "\nThe given element is found at postion "		# store necessary strings
message2: "Given element not found!"

.word
arr: 2, 4, 7, 10, 15		# input array is {2, 4, 7, 10, 15}

.text
main:
	la a1, arr		# load base address of array
	la a0, message0
	li a7, 4
	ecall
	li a7, 5		# take the input
	ecall
	addi a6, a0, 0		# store key to be found
	li a3, 0		# first = 0, last = n-1
	li a4, 4
LOOP:
	bgt a3, a4, UNSUC	# while( first <= last )
	add a5, a3, a4
	srli a5, a5, 1		# mid = ( first + last ) / 2
	slli s0, a5, 2
	add a2, a1, s0		# s1 = arr [ mid ]
	lw s1, 0(a2)
	blt a6, s1, CASE1	# if ( key < s1 )
	bgt a6, s1, CASE2	# else if ( key > s1 )
	la a0, message1	
	li a7, 4
	ecall			# else print result
	li a0, 0
	addi a0, a5, 1
	li a7, 1		# and break
	ecall
	j SUC
CASE1:				# if ( key < s1 )
	addi a4, a5, -1		# last = mid - 1
	j LOOP
CASE2:				# if ( key > s1 )
	addi a3, a5, 1		# first = mid + 1 
	j LOOP			
UNSUC:
	la a0, message2		# if ( first > last )
	li a7, 4		# print message2
	ecall
SUC:
	li a7, 10		# exit the program
	ecall


	
	
	
	
	
	
