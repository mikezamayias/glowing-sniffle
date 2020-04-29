.data
    int_a: .asciiz "Please enter integer A: "
    nei: .asciiz "Next even integer: "
    error: .asciiz "Wrong input."
    str_nl: .asciiz "\n"

.text
.globl main
main:
    #   print prompt for A
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, int_a
    syscall

    #   read A on $16
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$16, $2, $0 		# $16 = $2 + $0

    #   if 0 greater than A, go to raise
    bgt		$0, $16, raise_error  	# if $0 > $16 then raise

    #   counter on $17
    addi	$17, $0, -1			# $17 = $0 + -1

    #   two on $18
    addi	$18, $0, 2			# $18 = $0 + 2
for:
    #   add 1 to counter
    addi	$17, $17, 1			# $17 = $17 + 1
    beq		$17, $16, end_for	# if $17 == $16 then end_for

    #   calc counter div mod 2
    div		$17, $18			# $17 / $18
    mflo	$0					# $0 = floor($17 / $18)
    mfhi	$21					# $21 = $17 mod $18
    bne		$21, $0, for    	# if $21 != $0 then for

    #   print prompt next even integer
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, nei
    syscall

    #   Print next even integer
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $17		    # $4 = $0 + $17
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

    bne		$17, $16, for	    # if $17 != $16 then for

end_for:
    j		main				# jump to main

raise_error:
    #   print error message
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, error
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

j		main				# jump to main
