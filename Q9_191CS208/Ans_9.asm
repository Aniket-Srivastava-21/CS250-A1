# Program to calculate factorial of a number using multiply_proc

.data
.asciz
  str1: "Enter the number: "
  str2: "The factorial of the number is: "

.text
  la a0 , str1
  li a7 , 4           # print str1
  ecall
  
  li a7 , 5
  ecall              # read the number
  addi s0 , a0 , 0
  li s1, 1		# fact = 1, i = 2
  li s2, 2

loop1:			# for ( i = 2; i <= n; i++ )
  bgt s2, s0, exit1
  li t0 , 0          # j = 0, temp = 0
  li t1 , 0
  jal ra, multiply_proc		# call multiply_proc
  addi s2, s2, 1
  li s1, 0		# fact = temp
  addi s1, t1, 0
  j loop1
  
multiply_proc:		

loop2:			# for( j = 0; j < i; j++ )
  beq t0 , s2 , return
  add t1 , t1 , s1      # temp += fact
  addi t0 , t0 , 1
  j loop2
  
return:
	ret		# return

exit2:
  addi s2, s2, 1
  li s1, 0		# fact = temp
  addi s1, t1, 0
  j loop1
  
exit1:
  la a0 , str2
  li a7 , 4            # write str2
  ecall
 
  li a0, 0
  addi a0 , s1 , 0
  li a7 , 1             # write factorial value
  ecall
  
  li a7 , 10           # exit program
  ecall
