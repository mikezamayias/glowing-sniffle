.data
.text
.globl main

main:
    addi	$10, $0, 20			# $10 = $0 + 20
    bne		$10, 5, if_not   	# if $10 != 5 then if_not
    addi	$12, $10, 5			# $12 = $10 + 5
    j		end 				# jump to end
if_not:
    add	$12, $10, $10		    # $12 = $10 + $10
end:
