.data
dados :  .word 10,9,8,7,6,5,4,3,2,1


.text

main:
	la $s0, dados
	addi $s3,$s0,0
	
	li $v0, 5
	syscall
	
	add $t0,$zero,$v0
	addi $s1,$zero,10
		
	add $s6,$zero,$s0
	jal loop
	
	j end
	
	
loop:
	
	beq $t1,$s1,return
	addi $t1,$t1,1
	
	lw $t3,0($s6)
	sw $zero,0($s6)
	addi $s6,$s6,4
	
	blt $t0,$t3,salvar
	
	
	j loop

	
salvar:
	
	add $s7,$t7,$s3
	sw $t3,0($s7)
	addi $t7,$t7,4

	j loop
			
return:
	jr $ra
	 
end:
	li, $v0, 10
	syscall
