.data
   str1: .asciz "Enter number of fibonacci numbers:"
   str2: .asciz "Fibonicci numbers are\n"
   str3: .asciz " "
   
.text
   la a0 , str1
   li a7 , 4           # print string for taking input
   ecall
   
   li a7 , 5           # taking interger input
   ecall
   
   addi s0 , a0 , 0     # assigning number to S0 reg
   
   la a0 , str2
   li a7 , 4            # print sting for output 
   ecall
   
   li t0 , 0           # creating t0 and t1 for accessing last two values
   li t1 , 1
   li t2 , 2           # counter to keep the number of fibonicci numbeers
   
   beq s0 , t0 , exit  # for N=0
   
   bne s0 , t1 , loop1 # if N>=2
   addi a0 , t0 , 0
   li a7, 1
   ecall
   j exit              # exit the program
   
loop1:
   addi a0 , t0 , 0   # print first fib no
   li a7, 1
   ecall
   
   la a0 , str3       # print space
   li a7 , 4
   ecall
   
   bne s0 ,  t2 , loop2   # N>=3
   addi a0 , t1 , 0
   li a7 , 1
   ecall
   j exit
   
loop2:
   addi a0 , t1 , 0 # print 2nd fib no
   li a7 , 1
   ecall
   
   begin:
   bge t2 , s0 , exit    # if t2 is greater than equal to S0 program exit
   
   la a0 , str3
   li a7 , 4
   ecall
   
   add a0 , t1 , t0
   addi t0 , t1 ,  0
   addi t1 , a0  , 0
   addi t2 , t2 , 1
   li a7 , 1
   ecall
   j begin           # jumping back to begin label
  
exit:
   li a7 , 10
   ecall
