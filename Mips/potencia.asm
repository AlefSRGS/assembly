.text
	#INCOMPLETOOOO
	addi $t0, $zero, 3
	addi $t1, $zero, 2
	add $t2, $zero, $t0
	
	loop1: addi $t4, $zero,1
	slt $s0, $t3, $t1
	beq $s0, $zero,end
	
	loop2:slt $s1, $t4, $t0
	beq $s1, $zero, count
	add $t0, $t0, $t2
	addi $t4, $t4, 1
	
	count:addi $t3, $t3, 1
	j loop1
	
	end: