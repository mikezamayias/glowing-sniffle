.data
    student_name: .asciiz "Zamayias Michael Anaryiros"
    student_id: .asciiz "TP5000"
    message0: .asciiz "Enter element to matr_F: "
    message1_0: .asciiz "Element "
    message1_1: .asciiz " of matr_F: "
    message2: .asciiz "Number of positive integers in matr_F: "
    repeat_prompt: .asciiz "Run again or stop, use 1 or 0 respectively: "
    str_nl: .asciiz "\n"
#   
#   Initialize matr_F
#   
    matr_F:
        .align 4        # align = element (int) size in bytes
        .space 20       # space = align * number of elements = 4*5
.text
.globl main
main:
#   
#   Print name and id
#   
    #   print student_name
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, student_name
    syscall
    #   print new line
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, str_nl
    syscall
    #   print student_id
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, student_id
    syscall
    #   print new line
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, str_nl
    syscall
#   
#   Populate matr_F
#   
    #   counter for positive number at $20
    addi	$20, $zero, 0			                # $20 = $zero + 0
    #   pointer at $s0
    addi	$s0, $zero, 0			                # $s0 = $zero + 0
    #   last index at $s3
    addi	$s3, $zero, 19     			            # $s3 = $zero + 19
    #   store four at $s5
    addi	$s5, $zero, 4		    	            # $s5 = $zero + 4
while_populate_matr_F:
    #   print message 0 for user input
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message0
    syscall
    #   read user input at $s2
    addi	$v0, $zero, 5			                # $v0 = $zero + 5
    syscall
    add		$s2, $v0, $zero	    	                # $s2 = $v0 + $zero
    #   store value in matrix
    sw		$s2, matr_F($s0)
    #   increment pointer
    addi	$s0, $s0, 4		        	            # $s0 = $s0 + 4
#       
#   Check if int positive
#   
    bgt		$s2, $zero, positive_int               	# if $s2 > $zero then positive
    ble		$s2, $zero, not_positive_int	        # if $s2 <= $zero then not_positive_int
positive_int:
    addi	$20, $20, 1			                    # $20 = $20 + 1
not_positive_int:
    #   while condition check
    ble		$s0, $s3, while_populate_matr_F	        # if $s0 <= $s3 then while_populate_matr_F
    bgt		$s0, $s3, exit_populate_matr_F 	        # if $s0 > $s3 then exit_populate_matr_F
exit_populate_matr_F:
#   
#   Print first three items of matr_F
#   
    #   reset pointer
    addi	$s0, $zero, 0			                # $s0 = $zero + 0
    #   index counter at $s1
    addi	$s1, $zero, 0	                		# $s1 = $zero + 1
    #   last index at $s3
    addi	$s3, $zero, 11     			            # $s3 = $zero + 11
while_print_small_matr_F:
    #   load retrieved integer to $s2
    lw		$s2, matr_F($s0)
    #   print message1_0
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message1_0
    syscall
    #   print current index
    addi	$v0, $zero, 1			                # $v0 = $zero + 1
    add		$a0, $zero, $s1	    	                # $a0 = $zero + $s1
    syscall
    #   print message1_1
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message1_1
    syscall
    #   print retireved integer
    addi	$v0, $zero, 1			                # $v0 = $zero + 1
    add		$a0, $zero, $s2		                    # $a0 = $zero + $s2
    syscall
    #   print new line
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, str_nl
    syscall
    #   increment pointer
    addi	$s0, $s0, 4		        	            # $s0 = $s0 + 4
    #   increment index counter
    addi	$s1, $s1, 1			                    # $s1 = $s1 + 1
    #   while condition check
    ble		$s0, $s3, while_print_small_matr_F	    # if $s0 <= $s3 then while_print
    bgt		$s0, $s3, exit_print_small_matr_F	    # if $s0 > $s3 then exit_print_small_matr_F
exit_print_small_matr_F:
#   
#   Print $20
#  
    #   print message2
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, message2
    syscall
    #   print $20
    addi	$v0, $zero, 1			                # $v0 = $zero + 1
    add		$a0, $zero, $20		                    # $a0 = $zero + $20
    syscall
    #   print new line
    addi	$v0, $zero, 4			                # $v0 = $zero + 4
    la		$a0, str_nl
    syscall
#
#   Repeat execution of main
#
while:
    #   vars used to check repeat condition
    add		$t0, $zero, $zero	                    # $t0 = $zero + $zero           #   $t0 = 0
    addi	$t1, $zero, 1			                # $t1 = $zero + 1               #   $t1 = 1
    #   print repeat prompt
    addi	$2, $0, 4			                    # $2 = $0 + 4
    la      $4, repeat_prompt
    syscall
    #   read answer in $s7
    addi	$2, $0, 5			                    # $2 = $0 + 5
    syscall
    add		$s7, $2, $0                             # $s7 = $2 + $0
    #   check
    blt		$s7, $t0, while	                        # if $s7 < $t0 then while
    bgt		$s7, $t1, while	                        # if $s7 > $t1 then while
    beq		$s7, $t1, exit_while	                # if $s7 == $t1 then exit_while
    beq		$s7, $t0, exit_while	                # if $s7 == $t0 then exit_while
exit_while:
    beq		$s7, $t0, exit	                        # if $s7 == $t0 then exit
    j		main				                    # jump to main
exit:
    #   terminate program
    li		$v0, 10		                            # $v0 = 10
    syscall
    