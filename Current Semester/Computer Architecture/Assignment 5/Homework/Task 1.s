.data
    int_a: .asciiz "Input number A: "
    int_b: .asciiz "Input coefficient B: "
    raise_error: .asciiz "Wrong input, input must be a not negative number"
    mess1: .asciiz "Multiplication table of "
    mess2: .asciiz " from "
    mess3: .asciiz " to "
    sym_prod: .asciiz " * "
    sym_eq: .asciiz " = "
    str_nl: .asciiz "\n"

.text
.globl main
main:
    #   print prompt to read A
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, int_a
    syscall

    #   read A in $16
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$16, $2, $0         # $16 = $2 + $0

while:
    #   print prompt to read B
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, int_b
    syscall

    #   read B in $17
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$17, $2, $0         # $17 = $2 + $0
    blt		$17, $0, error	    # if $17 < $0 then error
    ble		$0, $17, exit_while	# if $0 <= $17 then exit_while

error:
    #   print error
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, raise_error
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall
    j		while				# jump to while

exit_while:
    #   print mess1
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, mess1
    syscall

    #   print A
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $16		    # $4 = $0 + $16
    syscall

    #   print mess2
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, mess2
    syscall

    #   print 0
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, 0		    # $4 = $0 + 0
    syscall

    #   print mess3
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, mess3
    syscall

    #   print B
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $17		    # $4 = $0 + $17
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall

    # add 1 to B to achieve closed interval
    addi	$17, $17, 1			# $17 = $17 + 1

    # initialize counter on $19
    addi	$19, $19, 0			# $19 = $19 + 0

for:
    # mulitply
    mult	$16, $19			# $16 * $17 = Hi and Lo registers
    mflo	$18					# copy Lo to $18

    #   print counter
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $19		    # $4 = $0 + $19
    syscall

    #   print *
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, sym_prod
    syscall

    #   print A
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $16		    # $4 = $0 + $16
    syscall

    #   print =
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, sym_eq
    syscall

    #   print product
    addi	$2, $0, 1			# $2 = $0 + 1
    add		$4, $0, $18		    # $4 = $0 + $18
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la      $4, str_nl
    syscall

    # increment counter by 1
    addi	$19, $19, 1			# $19 = $19 + 1

    # check
    blt		$19, $17, for	# if $19 < $17 then for

j		main				# jump to main
