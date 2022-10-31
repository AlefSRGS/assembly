.data
	request: .asciiz "diga sua idade: "
	resposta: .asciiz "a sua idade é: "
.text 
	#print string
	li $v0, 4 
	la $a0, request
	syscall
	
	#imput do numero int 
	li $v0, 5
	syscall
	
	#salvando valor recebido pelo usuario em outro registrador 
	move $t0, $v0
	
	#print string 
	li $v0, 4
	la $a0, resposta
	syscall
	
	#movendo valor fornecido pelo usario para poder printalo
	li $v0, 1
	move $a0, $t0
	syscall