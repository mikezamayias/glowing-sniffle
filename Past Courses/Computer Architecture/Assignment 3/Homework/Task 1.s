.data   #   initialization of data memmory with needed strings
    str_a: .asciiz "a = "
    str_b: .asciiz "b = "
    str_add: .asciiz "a + b = "
    str_sub: .asciiz "a - b = "
    str_prod: .asciiz "a * b = "
    str_nl: .asciiz "\n"

.text
.globl main
main:
    #   print prompt for a
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_a
    syscall

    #   read a
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$16, $2, $0 		# $16 = $2 + $0

    #   print prompt for b
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_b
    syscall

    #   read b
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$17, $2, $0 		# $17 = $2 + $0

    #   calc a+b
    add		$18, $16, $17		# $18 = $16 + $17

    #   print prompt for a+b
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_add
    syscall

    #   print a+b
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $18		    # $4 = $0 + $18
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

    #   calc a-b
    sub		$19, $16, $17		# $19 = $16 - $17

    #   print prompt for a-b
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_sub
    syscall

    #   print a-b
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $19		    # $4 = $0 + $19
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

    #   calc a*b
    mult	$16, $17			# $16 * $17 = Hi and Lo registers
    mflo	$20					# copy Lo to $20

    #   print prompt for a*b
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_prod
    syscall

    #   print a*b
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $20		    # $4 = $0 + $20
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

j		main    				# jump to main
