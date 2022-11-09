.text
    # 6/2 sem instrução div
    addi $t0, $zero, 6
	addi $t1, $zero, 2
	
	loop: slt $s0, $t0, $t1
	bne $s0, $zero, end
	sub $t0, $t0, $t1
	addi $t3, $t3, 1
	j loop
	
	end: