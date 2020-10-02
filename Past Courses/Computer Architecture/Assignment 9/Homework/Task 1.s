.data
    message_0_part_0: .asciiz "Enter integer "
    message_0_part_1: .asciiz " of 5: "
    message_1_part_0: .asciiz "Integer "
    message_1_part_1: .asciiz " of 5: "
    str_nl: .asciiz "\n"
    matr_A:
        .align 4
        .space 20
.text
.globl main
main:
    #   pointer at $s0
    addi	$s0, $zero, 0			                # $s0 = $zero + 0
    #   last index at $s3
    addi	$s3, $s3, 19     			            # $s3 = $s3 + 5
    #   store four at $s4
    addi	$s4, $zero, 4		    	            # $s4 = $zero + 4
    #   set counter equal to 5
    addi	$s1, $zero, 1                           # $s1 = $zero + 1
while_user_input:
    #   print message 0 for user input
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message_0_part_0
    syscall
    #   print current index
    addi	$v0, $zero, 1			                # $v0 = $zero + 1
    add		$a0, $zero, $s1	    	                # $a0 = $zero + $s1
    syscall
    #   print rest of message 0
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message_0_part_1
    syscall
    #   read user input at $s2
    addi	$v0, $zero, 5			                # $v0 = $zero + 5
    syscall
    add		$s2, $v0, $zero	    	                # $s2 = $v0 + $zero
    #   store value in matrix
    sw		$s2, matr_A($s0)
    #   increment pointer
    addi	$s0, $s0, 4		        	            # $s0 = $s0 + 4
    #   increment counter
    addi	$s1, $s1, 1			                    # $s1 = $s1 + 1
    #   while condition check
    ble		$s0, $s3, while_user_input	            # if $s0 <= $s3 then while_user_input
    bgt		$s0, $s3, exit_while_user_input 	    # if $s0 > $s3 then exit_while_user_input
exit_while_user_input:
    #   reduce pointer
    sub		$s0, $s0, $s4		                    # $s0 = $s0 - $s4
    #   reduce counter
    addi	$s1, $s1, -1                			# $s1 = $s1 + -1
while_reversed:
    #   set $s2 to 0
    add		$s2, $zero, $zero		# $s2 = $zero + $zero
    #   print message 0 for user input
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message_1_part_0
    syscall
    #   print current index
    addi	$v0, $zero, 1			                # $v0 = $zero + 1
    add		$a0, $zero, $s1	    	                # $a0 = $zero + $s1
    syscall
    #   print rest of message 0
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message_1_part_1
    syscall
    #   load retrieved integer
    lw		$s2, matr_A($s0)
    #   print retireved item
    addi	$v0, $zero, 1			    # $v0 = $zero + 1
    add		$a0, $zero, $s2		        # $a0 = $zero + $s2
    syscall
    #   print new line
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, str_nl
    syscall
    #   reduce counter
    addi	$s1, $s1, -1                			# $s1 = $s1 + -1
    #   reduce pointer
    sub		$s0, $s0, $s4		                    # $s0 = $s0 - $s4
    #   while condition check
    bge		$s0, $zero, while_reversed	            # if $s0 >= $zero then while_reversed
    blt		$s0, $zero, exit_while_reversed 	    # if $s0 < $zero then exit_while_reversed
exit_while_reversed:
    #   terminate program
    li		$v0, 10
    syscall
####        #   set pointer to last matrix index
####    while_reversed:

    
    