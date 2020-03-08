.text
.globl main
main:
    #   $16 = x, $17 = i, $18 = c
    addi	$16, $0, 0			# $16 = $0 + 0
    addi	$17, $17, 1			# $17 = $17 + 1
    addi	$18, $0, 6			# $18 = $0 + 6
    beq		$0, $0, target  	# if $0 == $0 then target    
target:
    add		$16, $16, $17		# $16 = $16 + $17
    addi	$17, $17, 1			# $17 = $17 + 1
    bne		$17, $18, target	# if $17 != $18 then target
