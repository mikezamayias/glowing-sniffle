.data
.text
.globl main

main:
    #   $5 = a, $6 = b, $7 = c
    addi	$5, $0, 8			# $5 = $0 + 8
    addi	$6, $0, 32			# $6 = $0 + 32
    addi	$7, $0, 0			# $7 = $0 + 0
    beq		$5, $6, if_not      # if $5 == $6 then if_not
    addi	$5, $6, 21			# $5 = $6 + 21
    j		end_if 				# jump to end_if
if_not:
    addi	$7, $5, 32			# $7 = $5 + 32
end_if:
    add		$6, $5, $7		# $6 = $5 + $7
