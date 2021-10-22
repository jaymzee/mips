# program adds 10 and 11

	.text
	.globl main

main:
	ori $8, $0, 0xA	# load 10 into reg 8
	ori $9, $0, 0xB	# load 11 into reg 9
	add $10, $8, $9

	li $v0, 10	# exit
	syscall
