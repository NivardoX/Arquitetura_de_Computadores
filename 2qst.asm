.data
dados :  .word 0
.text
	la $s0,dados 
	jal loop_rnd
	addi $s1,$zero,10
	jal ord
	
	
	j end
	
loop_rnd:
	bgt $t7,9, return
	la $t0,dados 
	li $t1,4
	mul $t2,$t7,$t1
	add $t0,$t2,$t0
	
	li $v0, 41  
	xor $a0, $a0, $a0     
 	syscall   
 	andi $a0,$a0,2147483647
	
	sw $a0,0($t0)    
	addi $t7,$t7,1
	j loop_rnd
	 
ord:
		
	loop1:
	
	
	beq $s1,$s2,return
		
	mul $t1,$s2,4
	add $t0,$t1,$s0
		
	addi $s2,$s2,1#i++
	
	lw $t3,($t0) #t3 = dados[i]
	add $t9,$zero,$t3 #menor = dados[i]
			

	add $s3,$s2,$zero
	
		loop2:
		
		
		
		beq $s3,$s1, loop1
						
		mul $t1,$s3,4
		add $t4,$t1,$s0
		lw $t5,($t4) #t5 = dados[j]
		
		addi $s3,$s3,1 #j++
		
		sub $t8,$t9,$t5#aux = menor - dados[j]
		blez $t8 ,loop2
		
		add $t7,$zero,$t5 #aux1 = dados[j]
		add $t5,$zero,$t9 #dados[j] = menor
		add $t9,$zero,$t7 #menor = aux1
		
		sw $t9,0($t0)
		sw $t5,0($t4) 
		j loop2									
	j loop1
	
	lw $t0, 32($s0)
	lw $t1, 36($s0)	
	sub $t2,$t1,$t0 #aux = menor - maior
	blez $t2 ,return
	
	sw $t1, 32($s0)
	sw $t0, 36($s0)	
	
	j return
	

return :
	jr $ra
end:
	li, $v0, 10
	syscall	
