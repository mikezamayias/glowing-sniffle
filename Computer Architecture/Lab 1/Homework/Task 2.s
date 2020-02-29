.data
.text
.globl main

main:
    addi	$16, $0, 15			    # $16 = $0 + 15
    add 	$16, $16, -8 			# $16 = $16 + -8
    add		$16, $16, $16   		# $16 = $16 + $16
    add		$16, $16, -4     		# $16 = $16 + -4
    j		main				    # jump to main
