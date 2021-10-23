# enter two integers in console window
# sum is displayed

	.text
	.globl main

main:
	li $v0, 5	# system call code for read_int
	syscall
	la $s0, value
	sw $v0, 0($s0)	# store result

	lw $t0, 0($s0)
	sll $t0, $t0, 1
	sw $t0, 4($s0)
	lw $t0, 0($s0)
	srl $t0, $t0, 1
	sw $t0, 8($s0)

	# print first value
	li $v0, 4	# system call for print_string
	la $a0, msg1
	syscall

	li $v0, 1	# system call for print_int
	lw $a0, 4($s0)
	syscall

	li $v0, 11	# system call for print_char
	la $a0, 10
	syscall

	# print second value
	li $v0, 4	# system call for print_string
	la $a0, msg2
	syscall

	li $v0, 1	# system call for print_int
	lw $a0, 8($s0)
	syscall

	li $v0, 11	# system call for print_char
	la $a0, 10
	syscall

	# exit program
	li $v0, 10	# system call for exit
	syscall

	.data
value:	.word 0, 0, 0
msg1:	.asciiz "2 * = "
msg2:	.asciiz "/ 2 = "
