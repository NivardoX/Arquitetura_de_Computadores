.data
dados:	.word 2,3,1,4,5,6,7,8,9,0
.text
	la $s0,dados 
	lw $t0,0($s0) #carrega v[0]
	andi $t1,$t0,1 #checa sé é impar e guarda em um aux
	jal soma	#pula pra soma		
	
	lw $t0,4($s0)
	andi $t1,$t0,1
	jal soma
	
	lw $t0,8($s0)
	andi $t1,$t0,1
	jal soma

	lw $t0,12($s0)
	andi $t1,$t0,1
	jal soma

	lw $t0,16($s0)
	andi $t1,$t0,1
	jal soma

	lw $t0,20($s0)
	andi $t1,$t0,1
	jal soma

	lw $t0,24($s0)
	andi $t1,$t0,1
	jal soma

	lw $t0,28($s0)
	andi $t1,$t0,1
	jal soma

	lw $t0,32($s0)
	andi $t1,$t0,1
	jal soma
		
	sw $t2,36($s0) #Guarda a soma dos pares na posição 36($s0)
	sw $t3,40($s0) #Guarda a soma dos ímpares na posição 40($s0)
	j end
soma:
	bgtz $t1,soma_impar
	add $t2,$t0,$t2
	j return
	
soma_impar:	
	add $t3,$t0,$t3
	j return
return:
	jr $ra
	
end:
	li, $v0, 10
	syscall	
