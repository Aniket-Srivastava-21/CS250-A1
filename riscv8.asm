.data
  str1: .asciz "Enter 1st value:"
  str2: .asciz "Enter 2nd value:"
  str3: .asciz "multiplication result is:"

.text
  la a0 , str1
  li a7 , 4           # print str1
  ecall
  
  li a7 , 5
  ecall              # read value1
  addi s0 , a0 , 0
  
  la a0 , str2
  li a7 , 4          # print str2
  ecall
  
  li a7 , 5
  ecall              #  read value2
  addi s1 , a0 , 0     
  
  li t0 , 0          # initialisation of index and sum tem reg
  li t1 , 0
  
loop:
  beq t0 , s1 , exit
  add t1 , t1 , s0      # contineous addition 
  addi t0 , t0 , 1
  j loop
  
exit:
  la a0 , str3
  li a7 , 4            # write str3
  ecall
 
  addi a0 , t1 , 0
  li a7 , 1             # write multiplication value
  ecall
  
  li a7 , 10           # exit program
  ecall