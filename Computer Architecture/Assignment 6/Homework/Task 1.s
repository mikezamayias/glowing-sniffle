.data
    int_a: .asciiz "Input integer A: "
    int_b: .asciiz "Input integer B: "
    int_c: .asciiz "Input integer C: "
    minimum: .asciiz " is the minimum"
    maximum: .asciiz " is the maximum"
    no_minimum: .asciiz "There is no minimum."
    no_maximum: .asciiz "There is no maximum."
    repeat_prompt: .asciiz "Run again or stop (use 1 or 0 respectively):"
    str_nl: .asciiz "\n"
.text
.globl main
main:
    jal		input_nums			# jump to input_nums and save position to $ra
    #   vars on $21, $22. later used in min_num and max_num
    addi	$21, $21, 0			# $21 = $21 + 0
    addi	$22, $22, 1			# $22 = $22 + 1
    jal		min_num				# jump to min_num and save position to $ra
    jal		max_num				# jump to max_num and save position to $ra
while:
    #   print repeat prompt
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, repeat_prompt
    syscall
    #   read answer in $23
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$23, $2, $0         # $23 = $2 + $0
    #   check input
    bgt		$23, $22, while	# if $23 > $22 then while
    blt		$23, $21, while	# if $23 < $21 then while
    beq		$23, $22, exit_while	# if $23 == $22 then exit_while
    beq		$23, $21, exit_while	# if $23 == $21 then exit_while
exit_while:
    beq		$23, $22, main	# if $23 == $22 then main
    beq		$23, $21, exit	# if $23 == $21 then exit
exit:
    li		$v0, 10		        # $v0 = 10
    syscall
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
    bne		$19, $20, minoc	# if $19 != $20 then minoc
minoc:
    #   if a and b are equal, then compare a and c
    beq		$19, 1, minac	        # if $19 == 1 then minac
    #   if b and c are equal, then compare a and b
    beq		$20, 1, minab	        # if $20 == 1 then minab
minac:
    blt		$16, $18, a_min	# if $16 < $18 then a_min
    blt		$18, $16, c_min	# if $18 < $16 then c_min
minab:
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
max_num:
    #   if there isnt max, then print max_error
    and     $19, $16, $17
    and     $20, $17, $18
    beq		$19, $20, max_error	# if $19 == $20 then max_error
    bne		$19, $20, maxoc	# if $19 != $20 then maxoc
maxoc:
    #   if a and b are equal, then compare a and c
    beq		$19, 1, maxac	        # if $19 == 1 then maxac
    #   if b and c are equal, then compare a and b
    beq		$20, 1, maxab	        # if $20 == 1 then maxab
maxac:
    bgt		$16, $18, a_max	# if $16 > $18 then a_max
    bgt		$18, $16, c_max	# if $18 > $16 then c_max
maxab:
    bgt		$16, $17, a_max # if $16 > $17 then a_max
    bgt		$17, $16, b_max # if $17 > $16 then b_max
    #   reset $19 and $20
    and     $19, $21, $22
    or      $20, $21, $22
    #   check if a is the maximum, $19 and $20 must be equal
    sgt     $19, $16, $17
    sgt     $20, $16, $18
    beq		$19, $20, a_min	    # if $19 == $20 then a_min
    #   reset $19 and $20
    and     $19, $21, $22
    or      $20, $21, $22
    #   check if b is the minimum, $19 and $20 must be equal
    sgt     $19, $17, $16
    sgt     $20, $17, $18
    beq		$19, $20, b_min	    # if $19 == $20 then b_min
    #   reset $19 and $20
    and     $19, $21, $22
    or      $20, $21, $22
    #   check if c is the minimum, $19 and $20 must be equal
    sgt     $19, $18, $16
    sgt     $20, $18, $17
    beq		$19, $20, c_min	    # if $19 == $20 then c_min
a_max:
    #   print a
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $16		    # $4 = $0 + $16
    syscall
    #   print maximum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, maximum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
b_max:
    #   print b
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $17		    # $4 = $0 + $17
    syscall
    #   print maximum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, maximum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
c_max:
    #   print c
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $18		    # $4 = $0 + $18
    syscall
    #   print maximum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, maximum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
max_error:
    #   print no maximum
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, no_maximum
    syscall
    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    # return
    jr		$ra					# jump to $ra
