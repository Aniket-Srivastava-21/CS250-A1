.data

arr: .word 
str1: .asciz "Enter the number: "
str2: .asciz "The fibonacci numbers are: \n"
str3: .asciz "  "

.text

main:    
        la    a0,str1
        li    a7,4
        ecall
                                            
        li    a7,5
        ecall
        
        li    s0, 1            
        li    a3,0
        addi  a4, a0,0
        
        la    a5, arr         # all fibonacci numbers will be stored in arr
        addi  a6,a5,0
        addi  s10,a3,0
        
        la    a0,str2
        li    a7,4
        ecall
        
        j loop
loop:
        bgt   a3,a4,print       # we loop from i=1 to n
        addi  a0,a3,0
        jal   ra, fib           # call fib
        mv    a1, a0           
        sw    a1,0(a5)          # store the result in arr
        addi  a5,a5,4
        addi  a3,a3,1
        j     loop
fib:
        ble   a0, s0, return   # if(n <= 1)
        addi  sp, sp, -12      
        sw    ra, 8(sp)        
        sw    a0, 4(sp)        
        addi  a0, a0, -1       
        jal   ra, fib          # call fib(n - 1)
        sw    a0, 0(sp)        # store the value of fib(n - 1)
        lw    a0, 4(sp)        
        addi  a0, a0, -2       
        jal   ra, fib          # call fib(n - 2)
        lw    t0, 0(sp)        
        add   a0, a0, t0       # fib(n - 1) + fib(n - 2)
        lw    ra, 8(sp)        
        addi  sp, sp, 12       
        ret                    
	
return:
        ret                    # return

print:                         # prinitng all the fibonacci numbers
        bge   s10,a4,exit
        lw    a0,0(a6)
        addi  a6,a6,4
        addi  s10,s10,1
        
	li    a7,1
	ecall
	
	la    a0,str3
	li    a7,4
	ecall
	
	j print
exit:
