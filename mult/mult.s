# sample example 'add two numbers

	.text
	.globl main

main:
	la	$s0, nums	# load nums into $s0
	lw	$t0, 0($s0)	# load nums[0]
	lw	$t1, 4($s0)	# load nums[1]

	multu	$t0, $t1
	mfhi	$t3
	mflo	$t4
	sw	$t3, 8($s0)	# store hi to nums[2]
	sw	$t4, 12($s0)	# store lo to nums[3]

	move	$a0, $t4
	li	$v0, 1
	syscall			# print_int result

	li	$v0, 11		# print_char
	li	$a0, 10		# linefeed
	syscall

	li	$v0, 10		# exit
	syscall

	.data
nums:
	.word 3, 7, 0, 0

