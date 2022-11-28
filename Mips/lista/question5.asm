.data 
	arrayResults:
		.space 12 #tamanho do vetor dos resultados
	
.text
	.main:
	#lendo os valores de A, B, X, Y
	li $v0, 5
	syscall
	add $a0, $zero, $v0 
	
	li $v0, 5
	syscall
	add $a1, $zero, $v0
	
	li $v0, 5
	syscall
	add $a2, $zero, $v0
	
	li $v0, 5
	syscall
	add $a3, $zero, $v0
	
	add $v0, $zero, $zero
	
	jal MULT #chamndo função de multiplicação
	addi $t0, $zero, 0 #colocando index do array como 0
	sw $v0, arrayResults($t0) #salvando resultado da multiplicação no vetor
	
	add $t3, $zero, $a3 #salvando valor de a3 para n perde-lo
	lw $a3, arrayResults($t0) #colocando resultado da multiplicação no parametro
	
	jal DIV
	addi $t0, $zero, 4 #mudando o index do array
	sw $v0, arrayResults($t0) #salvando novo resultado
	
	add $a3, $zero, $t3 #restaurando valor de a3
	
	lw $a0, arrayResults($t0)
	addi $a1, $zero, $a3
	
	jal POT
	addi $t0, $zero, 12 #mudando o index do array
	sw $v0, arrayResults($t0) #salvando novo resultado
	
	j end
	
	MULT:
		addi $t1, $zero, $a1 #salvando o valor de $a1 para n perde-lo
		add $a1, $zero, $a3
		
		add $t0, $zero, $zero
		loopMult:
			add $v0, $v0, $a0
			addi $t0, $t0, 1
			slt $t2, $t0, $a1
			bne $t2, $zero, loopMult
			
		add $a1, $zero, $t1 #restaurando o valor inical de a1
		jr $ra
		
	DIV:	
		add $t2, $zero, $a2 #salvando valor de a2
		add $a2, $zero, $a0 #colocando valor de a0 no parametro exigido na questao 
		add $v0, $zero, $zero
		loopDiv:
			sub $a2, $a2, $a3
			addi $v0, $v0, 1
			slt $t1, $a2, $a3
			bne $t1, $zero, loopDiv
			
		add $a2, $zero, $t2
		jr $ra
		
	POT:	
		add $v0, $zero, $zero
		add $t1, $zero, $zero
		loopPow:
			add $t0, $zero, $zero
			loopMultPow:
				add $v0, $v0, $a0
				addi $t0, $t0, 1
				slt $s0, $t0, $a0
				bne $t0, $s0, loopMultPow  
			addi $t1, $t1, 1
			slt $s1, $t1, $a1
			bne $s1, $zero, loopPow
		jr $ra
		
	end: