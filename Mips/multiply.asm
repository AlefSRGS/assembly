.text
    # 5*10 sem instrução mul 
    addi $t0, $zero, 5
	addi $t1, $zero, 10
	addi $t2, $zero, 1
	add $a2, $zero, $t0
	
	loop: slt $s0, $t2, $t1
	beq $s0, $zero, end
	add $t0, $t0, $a2
	addi $t2, $t2, 1
	j loop
	
	end: