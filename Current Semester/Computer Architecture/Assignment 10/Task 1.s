.data
    str_nl: .asciiz "\n"
    matr_A:
        .align 4        # align = element size in bytes
        .space 28       # space = align * number of elements
.text
.globl main
main:
    #   counter at $s1
    addi	$s1, $zero, 0			# $s1 = $zero + 0
    #   load [25, 3, -5, 0, 7, 12, 12] in matr_A
    addi	$s0, $zero, 25			# $s0 = $zero + 25
    sw		$s0, matr_A($s1)
    #   increment counter
    addi	$s1, $s1, 4 			# $s1 = $s1 + 4
    
    addi	$s0, $zero, 3			# $s0 = $zero + 3
    sw		$s0, matr_A($s1)
    #   increment counter
    addi	$s1, $s1, 4 			# $s1 = $s1 + 4
    
    addi	$s0, $zero, -5			# $s0 = $zero + -5
    sw		$s0, matr_A($s1)
    #   increment counter
    addi	$s1, $s1, 4 			# $s1 = $s1 + 4
    
    addi	$s0, $zero, 0			# $s0 = $zero + 0
    sw		$s0, matr_A($s1)
    #   increment counter
    addi	$s1, $s1, 4 			# $s1 = $s1 + 4
    
    addi	$s0, $zero, 7			# $s0 = $zero + 7
    sw		$s0, matr_A($s1)
    #   increment counter
    addi	$s1, $s1, 4 			# $s1 = $s1 + 4
    
    addi	$s0, $zero, 12			# $s0 = $zero + 12
    sw		$s0, matr_A($s1)
    
    #   reset counter
    addi	$s1, $zero, 0			# $s1 = $zero + 0

    #   terminate program
    li		$v0, 10
    syscall