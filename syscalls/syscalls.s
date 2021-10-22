# enter two integers in console window
# sum is displayed

	.text
	.globl main

main:
	la $t0, value
	li $v0, 5	# system call code for read_int
	syscall
	sw $v0, 0($t0)	# store result

	lw $t1, 0($t0)
	lw $t2, 4($t0)
	add $t3, $t1, $t2
	sw $t3, 8($t0)

	li $v0, 4	# system call for print_string
	la $a0, msg1
	syscall

	li $v0, 1	# system call for print_int
	move $a0, $t3
	syscall

	li $v0, 10	# system call for exit
	syscall

	.data
value:	.word 0, 33, 0
msg1:	.asciiz "Sum = "
