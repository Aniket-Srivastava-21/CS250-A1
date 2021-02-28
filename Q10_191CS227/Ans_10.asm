.data

str1: .asciz "The elements after adding are: \n"
space: .asciz " "
arr1: .word 1,2,3,4
arr2: .word 5,6,7,8
length: .word 4  # length of both arrays


.text

main: 
		la s1,arr1 	  # s1 stores the address of first array
		la s2,arr2        # s2 stores the address of second array
 
		li t2,0           # i=0
		li t3,0           # j=0
		lw t1,length

		addi s6,s1,0      # copy the address of first array to s6

		la a0, str1
		li a7,4
		ecall

add_arrays:
		bge t2,t1,print   # if i>=4 then go to print
		lw s3,0(s2)
		lw s4,0(s6)
		add s3,s3,s4      # add the corresponding elements of both the arrays
		sw s3,0(s6)       # store the sum in first array
		addi s2,s2,4      # move to next position in second array
		addi s6,s6,4      # move to next position in first array
		addi t2,t2,1      # i++
        	j add_arrays

                                 # here we print after adding the arrays
print:  
		bge t3,t1,end
		lw  a0,0(s1)
		addi s1,s1,4
        	addi t3,t3,1
        
        	li a7,1
        	ecall
        
        	la a0,space
        	li a7,4
        	ecall
        
        	j print
end:
