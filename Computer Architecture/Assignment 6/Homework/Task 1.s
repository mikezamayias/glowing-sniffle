
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
    #   jal		max_num				# jump to max_num and save position to $ra
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
    #   if a != b and b != c and c != a then
    #       if a < b and a < c then a minimum
    #       if b < a and b < c then b minimum
    #       if c < a and c < a then c minimum
    #   if a == b or b == c or c == a then
    #       no minimum
    #       if a == b then
    #           if c < a then c minimum
    #           if a < c then a minimum
    #       if b == c then
    #           if a < b then a minimum
    #           if b < a then b minimum
    #       if c == a then
    #           if b < c then b minimum
    #           if c < b then c minimum
    and     $19, $16, $17           # $19 = $16 && $17
    and     $20, $17, $18           # $20 = $17 && $18
    and     $21, $16, $18           # $21 = $16 && $18
    and     $22, $19, $20           # $22 = $19 && $20
    and     $23, $20, $21           # $23 = $20 && $21
    beq		$22, $23, no_equals     # if $22 == $23 then no_equals
    #   bne		$22, $23, min_error	    # if $22 != $23 then min_error
    no_equals:
        #   check equality
        beq		$19, $20, min_error 	# if $19 == $20 then min_error
        #   check a minimum
        blt		$16, $17, a_min_check	# if $16 < $17 then a_min_check
        a_min_check:
            blt		$16, $18, a_min_is	# if $16 < $18 then a_min_is
        #   check b minimum
        blt		$17, $16, b_min_check	# if $17 < $16 then b_min_check
        b_min_check:
            blt		$17, $18, b_min_is	# if $17 < $18 then b_min_is
        #   check c minimum
        blt		$18, $16, c_min_check	# if $18 < $16 then c_min_check
        c_min_check:
            blt		$18, $17, c_min_is	# if $18 < $17 then c_min_is
    a_min_is:
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
    b_min_is:
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
    c_min_is:
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
