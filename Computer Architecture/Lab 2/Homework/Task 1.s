.text
.globl main
main:
    addi    $16, $0, 10			# $16 = $0 + 10
    addi    $17, $0, 10			# $17 = $0 + 10
    beq		$16, $17, label1	# if $16 == $17 then label1
    sub		$18, $17, $16		# $18 = $17 - $16
    j		label2				# jump to label2
label1:
    sub		$18, $16, $17		# $18 = $16 - $17
label2:
    j		main				# jump to main
    