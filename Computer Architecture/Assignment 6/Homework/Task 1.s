.data
    int_a: .asciiz "Input integer A: "
    int_b: .asciiz "Input integer B: "
    int_c: .asciiz "Input integer C: "
    minimum: .asciiz " is the minimum"
    no_minimum: .asciiz "There is no minimum."
    str_nl: .asciiz "\n"
.text
.globl main
main:
    jal		input_nums			# jump to input_nums and save position to $ra
    #   temp vars on $21 and $22
    addi	$21, $21, 0			# $21 = $21 + 0
    addi	$22, $22, 1			# $22 = $22 + 1
    jal		min_num				# jump to min_num and save position to $ra
    j		main				# jump to main
#    li		$v0, 10		        # $v0 = 10
#    syscall
input_nums:
    #   print prompt to read A
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, int_a
    syscall
    #   read A in $16
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$16, $2, $0         # $16 = $2 + $0
    #   print prompt to read B
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, int_b
    syscall
    #   read B in $17
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$17, $2, $0         # $17 = $2 + $0
    #   print prompt to read C
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, int_c
    syscall
    #   read C in $18
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$18, $2, $0         # $18 = $2 + $0
    # return
    jr		$ra					# jump to $ra
min_num:
    #   if there isnt min, then print min_error
    and     $19, $16, $17
    and     $20, $17, $18
    beq		$19, $20, min_error	# if $19 == $20 then min_error
    bne		$19, $20, one_comparison	# if $19 != $20 then one_comparison
one_comparison:
    #   if a and b are equal, then compare a and c
    beq		$19, 1, a_c	        # if $19 == 1 then a_c
    #   if b and c are equal, then compare a and b
    beq		$20, 1, a_b	        # if $20 == 1 then a_b
a_c:
    blt		$16, $18, a_min	# if $16 < $18 then a_min
    blt		$18, $16, c_min	# if $18 < $16 then c_min
a_b:
    blt		$16, $17, a_min	# if $16 < $17 then a_min
    blt		$17, $16, b_min	# if $17 < $16 then b_min
    #   reset $19 and $20
    and     $19, $21, $22
    or      $20, $21, $22
    #   check if a is the minimum, $19 and $20 must be equal
    slt     $19, $16, $17
    slt     $20, $16, $18
    beq		$19, $20, a_min	    # if $19 == $20 then a_min
    #   reset $19 and $20
    and     $19, $21, $22
    or      $20, $21, $22
    #   check if b is the minimum, $19 and $20 must be equal
    slt     $19, $17, $16
    slt     $20, $17, $18
    beq		$19, $20, b_min	    # if $19 == $20 then b_min
#   reset $19 and $20
    and     $19, $21, $22
    or      $20, $21, $22
    #   check if c is the minimum, $19 and $20 must be equal
    slt     $19, $18, $16
    slt     $20, $18, $17
    beq		$19, $20, c_min	    # if $19 == $20 then c_min
a_min:
    #   print a
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $16		    # $4 = $0 + $16
    syscall
    #   print minimum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, minimum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
b_min:
    #   print b
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $17		    # $4 = $0 + $17
    syscall
    #   print minimum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, minimum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
c_min:
    #   print c
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $18		    # $4 = $0 + $18
    syscall
    #   print minimum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, minimum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
min_error:
    #   print no minimum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, no_minimum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
