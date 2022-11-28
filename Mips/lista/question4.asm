.data
	listaNum:
		.space 40 # tamanho do vetor 
.text
	.main:
		add $t0, $zero, $zero #index do vetor
		addi $t1, $zero, 10 #tamanho do meu vetor (quantidade de vezes que quero que o loop se repita)
		addi $t2, $zero, 0 #contador do procedimento 
		loop:
			li $v0, 5 #imput dos inteiros no vetor
			syscall
			
			add $t4, $zero, $v0 #colocar valor escrito pelo usuario no $t4
			sw $t4, listaNum($t0) #colocar valor de $t4 no vetor 
			addi $t0, $t0, 4 #mudar o index do vetor para receber o prox inteiro
			addi $t2, $t2, 1 # adicionando mais 1 ao contador

			slt $t3, $t2, $t1 # testando se o contador é menor que o tamanho do vetor
			bne $t3, $zero, loop #se o contador for menor que o vetor volta para o loop e le o proximo inteiro
		
		add $t0, $zero, $zero #index do vetor
		addi $t1, $zero, 44 #ultima posição do vetor
		add $v1, $zero, $zero #soma total
		
		loopSum:
			lw $t2, listaNum($t0) #colocando o elemento do vetor na posição $t0 no registrador $t2
			add $v1, $v1, $t2 #somando o elemento de do vetor no registrador da soma total de todos os elementos
			addi $t0, $t0, 4 #mudando o index para pegar o prox elemento do vetor
			
			slt $t4, $t0, $t1 #testando se o index atual é do ultimo elemento 
			bne $t4, $zero, loopSum #se o index ainda n for do ultimo elemento ira repetir e ir para o prox elemento
			
			add $v0, $zero, $zero #zerando o registrador $v0 que sera ultilizado 
			addi $t0, $zero, 10 # divisor
			
			loopDiv: slt $t1, $v1, $t0# testando se o dividendo é menor que o divisor 
			bne $t1, $zero, end #se for menor acaba a divisao
			sub $v1, $v1, $t0 #subtração sucessiva 
			addi $v0, $v0, 1 #quociente 
			j loopDiv
				
		end: