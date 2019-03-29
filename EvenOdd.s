.data 
	A: .asciiz "Enter value for A: "
	Even: "THIS IS EVEN"
	Odd: "THIS IS ODD"
	nextline: .asciiz "\n"
	
.text
	li $v0, 4
	la $a0, A # print the A value
	syscall
	
	
	li $v0, 5  # user value input
	syscall
	move $t0, $v0
	
	# IF
IF_A:
	andi, $t1, $t0, 1
	#Else
	bne $t1,$zero,ELSE_A
	
THEN_A:
	li $v0, 4 # print
	la $a0, Even
	syscall
	j DONE_A
	
ELSE_A:
	li $v0, 4 # print
	la $a0, Odd
	syscall
DONE_A:	
	
	li $v0, 10
	syscall

	
	
