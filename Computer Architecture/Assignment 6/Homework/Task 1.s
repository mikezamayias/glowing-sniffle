.data
    int_a: .asciiz "Input integer A: "
    int_b: .asciiz "Input integer B: "
    int_c: .asciiz "Input integer C: "
    minimum: .asciiz " is the minimum"
    str_nl: .asciiz "\n"
.text
.globl main
main:
    jal		input_nums			# jump to input_nums and save position to $ra
    jal		min_num				# jump to min_num and save position to $ra
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
    #   read B in $18
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$18, $2, $0         # $18 = $2 + $0
    # return
    jr		$ra					# jump to $ra
min_num:
    # counter on $19
    addi	$19, $19, 0			# $19 = $19 + 0
    # temp a on $20
    add		$20, $20, $16		# $20 = $20 + $16
    # temp b on $21
    add		$21, $21, $17		# $21 = $21 + $17
    # temp c on $22
    add		$22, $22, $18		# $22 = $22 + $18
while:
    subi	$20, $20, 1			# $20 = $20 - 1
    subi	$21, $21, 1			# $21 = $21 - 1
    subi	$22, $22, 1			# $22 = $22 - 1
    addi	$19, $19, 1			# $19 = $19 + 1

    #   print C
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
