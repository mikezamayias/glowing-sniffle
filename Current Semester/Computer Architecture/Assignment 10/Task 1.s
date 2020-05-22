.data
    str_nl: .asciiz "\n"
    tab: .asciiz "\t"
    matr_A:
        .align 4        # align = element (int) size in bytes
        .space 28       # space = align * number of elements
.text
.globl main
main:
    #   set 28 in $t2
    li		$t2, 28		            # $t2 = 28        
    #   set 0 in $t0
    li		$t0, 0          		# $t0 = 0
    #   counter in $t0
    addi	$t0, $zero, 0			# $t0 = $zero + 0
    #   load [25, 3, -5, 0, 7, 12, 12] in matr_A
    #   load first item
    addi	$t1, $zero, 25			# $t1 = $zero + 25
    sw		$t1, matr_A($t0)
    #   increment counter
    addi	$t0, $t0, 4 			# $t0 = $t0 + 4
    #   load second item
    addi	$t1, $zero, 3			# $t1 = $zero + 3
    sw		$t1, matr_A($t0)
    #   increment counter
    addi	$t0, $t0, 4 			# $t0 = $t0 + 4
    #   load third item
    addi	$t1, $zero, -5			# $t1 = $zero + -5
    sw		$t1, matr_A($t0)
    #   increment counter
    addi	$t0, $t0, 4 			# $t0 = $t0 + 4
    #   load fourth item
    addi	$t1, $zero, 0			# $t1 = $zero + 0
    sw		$t1, matr_A($t0)
    #   increment counter
    addi	$t0, $t0, 4 			# $t0 = $t0 + 4
    #   load fifth item
    addi	$t1, $zero, 7			# $t1 = $zero + 7
    sw		$t1, matr_A($t0)
    #   increment counter
    addi	$t0, $t0, 4 			# $t0 = $t0 + 4
    #   load sixth item
    addi	$t1, $zero, 12			# $t1 = $zero + 12
    sw		$t1, matr_A($t0)
    #   increment counter
    addi	$t0, $t0, 4 			# $t0 = $t0 + 4
    #   load seventh item
    addi	$t1, $zero, 12			# $t1 = $zero + 12
    sw		$t1, matr_A($t0)
    #   reset counter
    li		$t0, 0          		# $t0 = 0
    #   reset $t1
    li		$t1, 0          		# $t1 = 0
while:
    addi	$v0, $zero, 1			# $v0 = $zero + 1
    add		$a0, $zero, $t0 		# $a0 = $zero + $t0
    syscall
    #   print tab
    addi	$v0, $zero, 4			# $v0 = $zero + 4
    la		$a0, tab
    syscall
    #   load from matrix
    lw		$t1, matr_A($t0)
    addi	$v0, $zero, 1			# $v0 = $zero + 1
    add		$a0, $zero, $t1 		# $a0 = $zero + $t1
    syscall
    #   print new line
    addi	$v0, $zero, 4			# $v0 = $zero + 4
    la		$a0, str_nl
    syscall
    #   increment counter
    addi	$t0, $t0, 4			    # $t0 = $t0 + 4
    #   condition checks
    blt		$t0, $t2, while	        # if $t0 < $t2 then while
    bge		$t0, $t2, exit_while	# if $t0 >= $t2 then exit_while
exit_while:
    #   reset counter
    li		$t0, 0          		# $t0 = 0
    #   set 4 in $t4
    li		$t4, 4          		# $t4 = 4
    #   reset $t1
    li		$t1, 0          		# $t1 = 0
    jal		gnome_sort              # jump to gnome_sort and save position to $ra
    #   terminate program
    li		$v0, 10
    syscall
gnome_sort:
    loop:
        blt		$t0, $t2, compare	# if $t0 < $t2 then compare
        bge		$t0, $t2, end	    # if $t0 >= $t2 then end
        #   increment counter (i)
        addi	$t0, $t0, 4			# $t0 = $t0 + 4
        #   increment counter (i+1)
        addi	$t4, $t4, 4			# $t4 = $t4 + 4
    compare:
        lw		$t1, matr_A($t0)    # load matr_A($t0) in $t1
        lw		$t3, matr_A($t4)    # load matr_A($t4) in $t1
        blt		$t3, $t1, swap  	# if $t3 < $t1 then swap
        j		loop				# jump to loop
    swap:
        add		$t5, $zero, $t1		# $t5 = $zero + $t1
        add		$t1, $zero, $t3		# $t1 = $zero + $t3
        add		$t3, $zero, $t5		# $t3 = $zero + $t5
        j		loop				# jump to loop
    end:
        jr		$ra					# jump to $ra
        