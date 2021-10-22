	.text
	.globl main
main:
	l.s $f12, num1
	li $v0, 2	# syscall for print_float
	syscall

	li $a0, 10	# linefeed
	li $v0, 11	# syscall for print_char
	syscall

	l.d $f12, num2
	li $v0, 3	# syscall for print_float
	syscall

	li $a0, 10	# linefeed
	li $v0, 11	# syscall for print_char
	syscall

	li $v0, 10	# syscall exit
	syscall

	.data
num1:
	.float 3.14
num2:
	.double 3.14
