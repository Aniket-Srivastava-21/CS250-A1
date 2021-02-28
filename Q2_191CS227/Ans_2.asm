.data
 str1:
  .string "Hello World!!"
  
.text
  main:
    li a0 , 1
    la a1 , str1
    li a2 , 13
    li a7 , 64
    ecall
    
    li a0 , 0
    li a7 , 93
    ecall
    