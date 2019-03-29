.data 
	A: .asciiz "Enter value for A: "
	Even: "THIS IS EVEN"
	var: .word 42
	N: .word 5
	Num_1: .word 1 
	ET: .asciiz "Too many time"
.text
	lw $s3, N
	lw $s4, Num_1
	sub $s3,$s4,$s3
	
	
	
	li $v0, 4
	la $a0, A # print the A value
	syscall
	
	
	li $v0, 5  # user value input
	syscall
	move $t0, $v0
	
LOOPINIT:
	li $s1,1
	
WHILE:

	# IF
IF_A:
	andi, $t1, $t0, 1 # if t1 = 0, t1 is even 
	#Else
	bne $t1,$zero,ELSE_A # t1 not equal to zero
	
THEN_A:
	li $v0, 4 # print
	la $a0, Even
	syscall
	j DONE_A
	
ELSE_A:
	add $s0, $s1, $s3 #s0 = s1 + s3
	bgtz $s0, EXIT #s0 > 0 Exit
	addi $s1, $s1, 1 # s1 +=1
	
	li $v0, 4
	la $a0, A # print the A value
	syscall
	li $v0, 5  # user value input
	syscall
	move $t0, $v0
	
	j WHILE


DONE_A:
	li $v0, 10
	syscall
	


EXIT:	
	li $v0, 4
	la $a0, ET
	syscall
