.data
.text
.globl main

main: 
    addi	$8, $0, 7			# $8 = $0 + 7
    addi	$9, $0, 15			# $9 = $0 + 15
    add		$10, $8, $9 	    # $10 = $8 + $9
    j		main				# jump to main
