.data
    int_A: .asciiz "Please enter integer A: "
    int_B: .asciiz "Please enter integer B: "
    A_smaller: .asciiz "A is smaller than B."
    B_smaller: .asciiz "B is smaller than A."
    A_equals_B: .asciiz "A and B are equal."
    str_nl: .asciiz "\n"

.text
.globl main
main:
    #   print prompt for A
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, int_A
    syscall

    #   read A to register 16
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$16, $2, $0 		# $16 = $2 + $0

    #   print prompt for B
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, int_B
    syscall

    #   read B to register 17
    addi	$2, $0, 5			# $2 = $0 + 5
    syscall
    add		$17, $2, $0 		# $16 = $2 + $0

    #   check if A and B are not equal
    bne		$16, $17, not_equals	# if $16 != $17 then not_equals

    #   if not not equal, print A and B are equal
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, A_equals_B
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall


not_equals:
    #   check if A is smaller than B
    bgt		$17, $16, a_smaller	# if $17 > $16 then a_smaller

    #   if not A is smaller than B, print B is smaller than A
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, B_smaller
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall


a_smaller:
    #   print "A is smaller than B"
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, A_smaller
    syscall

    #   print new line
    addi	$2, $0, 4			# $2 = $0 + 4
    la		$4, str_nl
    syscall

j		main				# jump to main
