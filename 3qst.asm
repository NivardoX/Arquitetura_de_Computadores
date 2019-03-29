.data 
	
	string: .asciiz  "o paulo eh gado dms\n"
	linha: .asciiz "\n"
	saida: .asciiz ""

.text

main:
	la $a0, string
	la $t4,saida
	la $t5,saida
	
	li $v0, 4
	syscall
	
	li $v0,12
	syscall
	
	add $t0,$v0,$zero
	
	jal loop
	
	la $a0,saida
	li $v0, 4
	syscall
	
	j end

loop:	
	beq $s2,19,return
	

	la $s0,string
	add $s1,$s0,$s2
	lb $t1,0($s1)
	
	addi $s2,$s2,1
	
	xor $t2,$t1,$t0
	beqz $t2,loop
	
		
	add $t3,$zero,$t1
	sb $t3,0($t4)
	addi $t4,$t4,1
	
	
	j loop
	
print:

	
	
	j return
	
return:
	jr $ra
	
end:
	li, $v0, 10
	syscall
