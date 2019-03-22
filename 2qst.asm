.data
dados :  .word 0
.text
	la $s0,dados 
	jal loop
	
	lw, $t0, 0($s0) 
	lw, $t1, 4($s0)
	lw, $t2, 8($s0)
	lw, $t3, 16($s0)
	lw, $t4, 20($s0)
	lw, $t5, 24($s0)
	lw, $t6, 28($s0)
	lw, $t7, 32($s0)
	lw, $t8, 36($s0)
	lw, $t9, 40($s0)
	j ord
	
	
	
	j end
	
loop:
	bgt $t7,9, return
	la $t0,dados 
	li $t1,4
	mul $t2,$t7,$t1
	add $t0,$t2,$t0
	
	li $v0,41      
 	xor $a0, $a0, $a0   
	syscall   
	
	  
	sw $a0,0($t0)    
	addi $t7,$t7,1
	j loop  

ord:
	bgt $s0,9, return
	sw $a0,0($t0)    
	addi $t7,$t7,1
	j loop  
	

return :
	jr $ra
end:
	li, $v0, 10
	syscall	
