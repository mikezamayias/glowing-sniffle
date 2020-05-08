.data
    num_a: .asciiz "Input number A: "
    num_b: .asciiz "Input number B: "
    num_c: .asciiz "Input number C: "
    bigger_0: .asciiz "First bigger number: "
    bigger_1: .asciiz "Second bigger number: "
    pr_end: .asciiz "Program end."
    str_nl: .asciiz "\n"
.text
.globl main
main:
    addi	$19, $19, $0			# first bigger
    addi	$20, $20, $0			# second bigger
    addi	$21, $21, $0			# temp
    addi	$22, $22, $0			# smaller
    # print prompt to read A
    addi	$2, $0, 4			    # $2 = $0 + 4
    la      $4, num_a
    syscall
    # read A in $16
    addi	$2, $0, 5			    # $2 = $0 + 5
    syscall
    add		$16, $2, $0             # $16 = $2 + $0
    # print prompt to read B
    addi	$2, $0, 4			    # $2 = $0 + 4
    la      $4, num_b
    syscall
    # read B in $17
    addi	$2, $0, 5			    # $2 = $0 + 5
    syscall
    add		$17, $2, $0             # $17 = $2 + $0
    # print prompt to read C
    addi	$2, $0, 4			    # $2 = $0 + 4
    la      $4, num_c
    syscall
    # read C in $18
    addi	$2, $0, 5			    # $2 = $0 + 5
    syscall
    add		$18, $2, $0             # $18 = $2 + $0
    #   compare vars
    bgt		$16, $17, ab            # if $16 > $1a then ab
    ble		$16, $17, not_ab	    # if $16 <= $17 then not_ab
    bgt		$18, $21, ct	        # if $18 > $21 then ct
    ble		$18, $21, not_ct	    # if $18 <= $21 then not_ct
    # print first bigger message
    addi	$2, $0, 4			    # $2 = $0 + 4
    la		$4, bigger_0
    syscall
    # print first bigger number
    addi	$2, $0, 1			    # $2 = $0 + 1
    add		$4, $0, $v0		        # $4 = $0 + $v0
    syscall
    # print new line
    addi	$2, $0, 4			    # $2 = $0 + 4
    la      $4, str_nl
    syscall
    # print second bigger message
    addi	$2, $0, 4			    # $2 = $0 + 4
    la		$4, bigger_0
    syscall
    # print second bigger number
    addi	$2, $0, 1			    # $2 = $0 + 1
    add		$4, $0, $v1		        # $4 = $0 + $v1
    syscall
    # print new line
    addi	$2, $0, 4			    # $2 = $0 + 4
    la      $4, str_nl
    syscall
    # print program end
    addi	$2, $0, 4			    # $2 = $0 + 4
    la		$4, pr_end
    syscall
    # end program
    li		$v0, 10		            # $v0 = 10
    syscall
ab:
    add		$19, $19, $16		    # first_bigger = A
    add		$21, $21, $17		    # temp = B
not_ab:
    add		$19, $19, $17		    # first_bigger = B
    add		$21, $21, $16		    # temp = A
ct:
    addi	$20, $20, $18		    # second_bigger = C
    add		$22, $22, $21		    # smaller = temp
not_ct:
    add		$20, $20, $21		    # second_bigger = temp
    add		$22, $22, $18		    # smaller = C
