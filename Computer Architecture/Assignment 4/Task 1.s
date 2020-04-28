.data
    int_a: .asciiz "Please enter integer A: "
    int_b: .asciiz "Please enter integer B: "
    a_smaller: .asciiz "A is smaller than B."
    b_smaller: .asciiz "B is smaller than A."
    a_equals_b: .asciiz "A and B are equal."
    str_nl: .asciiz "\n"

.text
.globl main
main:
    #   print prompt for A
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, int_a
    syscall
    
    #   read A to $16
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$16, $2, $0 		# $16 = $2 + $0

    #   print prompt for B
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, int_b
    syscall
    
    #   read B to $17
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$17, $2, $0 		# $16 = $2 + $0

    #   A and B are not equal
    bne		$16, $17, not_equal 	# if $16 != $17 then not_equal
    
    #   print "A and B are equal"
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, a_equals_b
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

    j		main    				# jump to main

not_equal:
    #   initialize two registers for check
    addi	$21, $0, 0			# $21 = $0 + 0
    addi	$22, $0, 1			# $22 = $0 + 1

    #   A is smaller than B
    slt     $21, $16, $17           # if $16 < $17 then $21 = 1 else $21 = 0
    beq		$21, $22, A_smaller     # if $21 == $22 then A_smaller

    #   print "B is smaller than A"
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, b_smaller
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

    j		main    				# jump to main


A_smaller:
    #   print "A is smaller than B"
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, a_smaller
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

    j		main    				# jump to main
    