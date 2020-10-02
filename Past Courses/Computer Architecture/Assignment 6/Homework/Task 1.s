.data
    int_a: .asciiz "Enter integer A: "      #   A at $16
    int_b: .asciiz "Enter integer B: "      #   B at $17
    int_c: .asciiz "Enter integer C: "      #   C at $18
    minimum: .asciiz " is minimum."
    maximum: .asciiz " is maximum."
    no_minimum: .asciiz "There is no minimum."
    no_maximum: .asciiz "There is no maximum."
    repeat_prompt: .asciiz "Run again or stop, use 1 or 0 respectively: "
    str_nl: .asciiz "\n"
.text
.globl main
main:
    jal		input_nums			# jump to input_nums and save position to $ra
    jal		min_num				# jump to min_num and save position to $ra
    jal		max_num				# jump to max_num and save position to $ra
    #   vars used in condition checking
    add		$21, $zero, $zero	        # $21 = $zero + $zero           #   $21 = 0
    addi	$22, $zero, 1			    # $22 = $zero + 1               #   $22 = 1
    while:
        #   print repeat prompt
        addi	$2, $0, 4			    # $2 = $0 + 4
        la      $4, repeat_prompt
        syscall
        #   read answer in $23
        addi	$2, $0, 5			    # $2 = $0 + 5
        syscall
        add		$23, $2, $0             # $23 = $2 + $0
        #   check
        blt		$23, $21, while	        # if $23 < $21 then while
        bgt		$23, $22, while	        # if $23 > $22 then while
        beq		$23, $22, exit_while	# if $23 == $22 then exit_while
        beq		$23, $21, exit_while	# if $23 == $21 then exit_while
    exit_while:
        beq		$23, $21, exit	        # if $23 == $21 then exit
        j		main				    # jump to main
    exit:
        li		$v0, 10		            # $v0 = 10
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
    beq		$16, $17, min_ab_eq	    # if $16 == $17 then min_ab_eq
    beq		$17, $18, min_bc_eq	    # if $17 == $18 then min_bc_eq
    beq		$16, $18, min_ac_eq	    # if $16 == $18 then min_ac_eq
    min_no_eq:
        blt		$16, $17, a_ls_b	# if $16 < $17 then a_ls_b
        blt		$17, $18, b_ls_c	# if $17 < $18 then b_ls_c
        blt		$18, $16, c_ls_a	# if $18 < $16 then c_ls_a
        a_ls_b:
            blt		$16, $18, a_min	# if $16 < $18 then a_min
        b_ls_c:
            blt		$17, $16, b_min	# if $17 < $16 then b_min
        c_ls_a:
            blt		$18, $17, c_min	# if $18 < $17 then c_min
    min_ab_eq:
        beq		$17, $18, min_error	# if $17 == $18 then min_error
        blt		$17, $18, b_min	    # if $17 < $18 then b_min
        blt		$18, $17, c_min	    # if $18 < $17 then c_min
    min_bc_eq:
        beq		$16, $17, min_error	# if $16 == $17 then min_error
        blt		$16, $18, a_min	    # if $16 < $18 then a_min
        blt		$18, $16, c_min	    # if $18 < $16 then c_min
    min_ac_eq:
        beq		$17, $16, min_error	# if $17 == $16 then min_error
        blt		$17, $16, b_min	    # if $17 < $16 then b_min
        blt		$16, $17, a_min	    # if $16 < $17 then a_min
    a_min:
        #   print $16
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
        #   print $17
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
        #   print $18
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
    beq		$16, $17, max_ab_eq	    # if $16 == $17 then max_ab_eq
    beq		$17, $18, max_bc_eq	    # if $17 == $18 then max_bc_eq
    beq		$16, $18, max_ac_eq	    # if $16 == $18 then max_ac_eq
    max_no_eq:
        bgt		$16, $17, a_gr_b	# if $16 > $17 then a_gr_b
        bgt		$17, $18, b_gr_c	# if $17 > $18 then b_gr_c
        bgt		$18, $16, c_gr_a	# if $18 > $16 then c_gr_a
        a_gr_b:
            bgt		$16, $18, a_max	# if $16 > $18 then a_max
        b_gr_c:
            bgt		$17, $16, b_max	# if $17 > $16 then b_max
        c_gr_a:
            bgt		$18, $17, c_max	# if $18 > $17 then c_max
    max_ab_eq:
        beq		$17, $18, max_error	# if $17 == $18 then max_error
        bgt		$17, $18, b_max	    # if $17 > $18 then b_max
        bgt		$18, $17, c_max	    # if $18 > $17 then c_max
    max_bc_eq:
        beq		$16, $17, max_error	# if $16 == $17 then max_error
        bgt		$16, $18, a_max	    # if $16 > $18 then a_max
        bgt		$18, $16, c_max	    # if $18 > $16 then c_max
    max_ac_eq:
        beq		$17, $16, max_error	# if $17 == $16 then max_error
        bgt		$17, $16, b_max	    # if $17 > $16 then b_max
        bgt		$16, $17, a_max	    # if $16 > $17 then a_max
    a_max:
        #   print $16
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
        #   print $17
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
        #   print $18
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
