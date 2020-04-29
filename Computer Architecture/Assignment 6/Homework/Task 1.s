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
    #   check_0 on $19, ckeck_1 on $20
    addi	$19, $19, 0			# $19 = $19 + 0
    addi	$20, $20, 1			# $20 = $20 + 1
    #   check if a is the minimum, $19 and $20 must be equal
    slt     $19, $16, $17
    slt     $20, $16, $18
    beq		$19, $20, a_min	    # if $19 == $20 then a_min
    #   check_0 on $19, ckeck_1 on $20
    addi	$19, $19, 0			# $19 = $19 + 0
    addi	$20, $20, 1			# $20 = $20 + 1
    #   check if b is the minimum, $19 and $20 must be equal
    slt     $19, $17, $16
    slt     $20, $17, $18
    beq		$19, $20, b_min	    # if $19 == $20 then b_min
    #   check_0 on $19, ckeck_1 on $20
    addi	$19, $19, 0			# $19 = $19 + 0
    addi	$20, $20, 1			# $20 = $20 + 1
    #   check if c is the minimum, $19 and $20 must be equal
    slt     $19, $18, $16
    slt     $20, $18, $17
    beq		$19, $20, c_min	    # if $19 == $20 then c_min
    #   check_0 on $19, ckeck_1 on $20
    addi	$19, $19, 0			# $19 = $19 + 0
    addi	$20, $20, 1			# $20 = $20 + 1
    #   if there isnt min, then print message
    bne		$19, $20, min_error	# if $19 != $20 then min_error
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

