.data
.text
.globl main

main:
    #   $10 = s, $11 = x, $12 = 7, $13 = y
    addi	$10, $0, 0			# $10 = $0 + 0
    addi	$11, $0, 1  		# $11 = $0 + 1
    addi	$12, $0, 8		    # $12 = $0 + 8
    addi	$13, $0, 0			# $13 = $0 + 0
for:
    add     $10, $10, $11		# $10 = $10 + $11
    addi	$11, $11, 1			# $11 = $11 + 1
    bne		$11, $12, for	    # if $11 != $12 then for
    beq		$0, $0, end_for 	# if $0 == $0 then end_for
end_for:
    sub		$13, $10, $11		# $13 = $10 - $11
