# run with spim

#------------{ global data section } ------------#
# declare all global variables and string #
# constants in this section. #
#------------------------------------------------#
	.data
hello_str:
	.asciiz "Hello World!"


#------------{ code section }--------------------#
# place all main code and procedure code in #
# this section of the file #
#------------------------------------------------#
	.text
# declare main as a global symbol
	.globl main
main:
	subu $sp, $sp, 4	# create a word on the stack
	sw $ra, 0($sp)		# store the return address
# put main function code here
	li $v0, 4		# set $v0 to print_string
	la $a0, hello_str	# load the string
	syscall			# call print_string
# exit the program
	lw $ra, 0($sp)		# restore the return address
	addu $sp, $sp, 4	# restore the stack
	j $ra			#return
