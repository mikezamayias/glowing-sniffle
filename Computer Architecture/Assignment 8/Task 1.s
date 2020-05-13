.data
    message_0_part_0: .asciiz "Enter integer "
    message_0_part_1: .asciiz " of 5: "
    message_1: .asciiz "Which item would you like to retrieve (1-5)?"
    message_2: .asciiz "The item you'd like to retrieve is: "
    str_nl: .asciiz "\n"
    matr_A:
        .align 4
        .space 20
.text
.globl main
main:
    #   pointer at $s0
    addi	$s0, $zero, 0			    # $s0 = $zero + 0
    #   last index at $s3
    addi	$s3, $s3, 19     			# $s3 = $s3 + 5
    #   store four at $s4
    addi	$s4, $zero, 4		    	# $s4 = $zero + 4
    
while:
    #   temp var at $s1 for printing index
    div		$s1, $s0, $s4
    #   then add 1
    addi	$s1, $s1, 1	        		# $s1 = $s1 + 1
    #   print message 0 for user input
    addi	$v0, $zero, 4			    # $v0 = $zero + 4
    la		$a0, message_0_part_0
    syscall
    #   print current index
    addi	$v0, $zero, 1			    # $v0 = $zero + 1
    add		$a0, $zero, $s1	    	    # $a0 = $zero + $s1
    syscall
    #   print rest of message 0
    addi	$v0, $zero, 4			    # $v0 = $zero + 4
    la		$a0, message_0_part_1
    syscall
    #   read user input at $s2
    addi	$v0, $zero, 5			    # $v0 = $zero + 5
    syscall
    add		$s2, $v0, $zero	    	    # $s2 = $v0 + $zero
    #   store value in matrix
    sw		$s2, matr_A($s0)
####    #   print $s2
####    addi	$v0, $zero, 1			    # $v0 = $zero + 1
####    add		$a0, $zero, $s2		        # $a0 = $zero + $s2
####    syscall
####    #   print $s0
####    addi	$v0, $zero, 1			    # $v0 = $zero + 1
####    add		$a0, $zero, $s0		        # $a0 = $zero + $s0
####    syscall
####    #   print new line
####    addi	$v0, $zero, 4			    # $v0 = $zero + 4
####    la		$a0, str_nl
####    syscall
    #   increment pointer
    addi	$s0, $s0, 4		        	# $s0 = $s0 + 4
    #   increment counter
    addi	$s1, $s1, 4			        # $s1 = $s1 + 4
    ble		$s0, $s3, while	            # if $s0 <= $s3 then while
    bgt		$s0, $s3, exit_while	    # if $s0 > $s3 then exit_while
exit_while:
    #   terminate program
    li		$v0, 10	              	    # $v0 = 10
    syscall
    
