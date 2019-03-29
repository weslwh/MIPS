.data
	H_M: .asciiz "How many integers to be multiplied? "
 	INT: .asciiz "Input integer: "
.text 	
	# Get the number of integer
	li $v0, 4
	la $a0, H_M
	syscall
	li $v0, 5
	syscall
	move $s0,$v0
	# initized the number 1
	add $t1, $zero, 1
WHILE:
	li $v0,4
	la $a0, INT # the multiplied integer
	syscall
	li $v0, 5 # get multiplied integer 
	syscall
	# input integer time 1
	mult $v0,$t1 # input integer times number 1
	mflo $t2 # get the integer from multiplied
	# move the new number to first multiply number
	move $t1, $t2
counter:
	addi $t6, $t6, 1 #init the t6 = 0
	beq $t6, $s0, DONE  # when t6 = H_M, DONE
	# loop 
	j WHILE
DONE:
	li $v0,1 #print integer
	move $a0, $t1 # move the final t1 to a0
	syscall
	li $v0, 10 # end the code
	syscall