# File: product.asm
# Description: A program that finds the product of three unsigned number A*B*C. 
# 	       The operands are found in memory locations 1(A), 2(B), and 3(C). 
#	       The results will be written into locations 4(high bits) and 5 
#              (low bits). If overflow, need only store lower 16 bits.
#	       Refer to product.asm for C-Equivalent code
# Authors: Angela To, Frank Mezzatesta
# Date: 1/18/15

INIT:
	!-- Initialize variables and seed $CL and $CR
	otype	rframe, 0	# REG FRAME 0
	otype   clear, 0    	# $reg0(ptr) = 0
    	move    2, 0        	# $reg2(ABlo) = 0
    	move    3, 0        	# $reg3(prodlo) = 0
    	incdec  0, 0, 0    	# $reg0(ptr) = 1
    	otype   rframe, 1    	# REG FRAME 1
    	otype   clear, 0	# $reg0(i) = 0
    	seed    1, 0, 0 	# Seed $reg0(i) into $CL
    	move    2, 0        	# $reg2(ABhi) = 0
	move    3, 0        	# $reg3(prodhi) = 0
    	otype   rframe, 0    	# REG FRAME 0
	load    1, 0        	# $reg1(A) <= MEM[ptr=1]
	incdec  0, 0, 0    	# ptr++
    	seed    0, 1, 1    	# Seed $reg1(A) into $CR
    	load    1, 0        	# $reg1(B) <= MEM[ptr=2]
    	incdec  0, 0, 0    	# ptr++

	!-- Set up conditional negation flag
    	otype   nset, 1		# if the condition is NOT met, break

	!-- Set jump(to) addresses
	focus   3, 0        	# $J0 store &LOOP1 (line024)
    	upper   1
    	lower   8
    	focus   3, 1        	# $J1 store &END1 (line030)
    	upper   1
    	lower   14

        !-- Set up overflow target
    	focus   1, 2        	# focus on ABhi

LOOP1($J0):
    	jumpif  1, 2		# jump to $J1(END1) if NOT i < A
    	otype   nop        	# we can actually do without this, but it’s clearer with it
    	add    	2, 1        	# ABlo += B (overflow into ABhi)
    	otype   ovrflw, 0    	# ABhi++ if overflow
    	jumpif  0, 3        	# reloop
    	incdec	1, 0, 0    	# i++ (nop slot)
    	
END1($J1):
    	load	1, 0        	# $reg1(C) <= MEM[ptr=3]
    	incdec  0, 0, 0    	# ptr++
    	seed    0, 1, 1    	# Seed $reg1(C) into $CR
    	otype   rframe, 1    	# REG FRAME 1
    	otype   clear, 0    	# $reg0(i) = 0
    	otype   rframe, 0    	# REG FRAME 0

	!-- Set jump(to) addresses
    	focus   3, 2        	# $J2 store &LOOP2 (line042)
    	upper   2
    	lower   10
    	focus   3, 3      	# $J3 store &END2 (line052)
    	upper   3
    	lower   4

LOOP2($J2):
    	jumpif	3, 2        	# jump to $J3(END2) if NOT i < A
    	otype   nop        	# we can actually do without this, but it’s clearer with it
	otype   rframe, 1    	# REG FRAME 1
    	add    	3, 2        	# prodhi += ABhi (overflow into the abyss)
    	otype   rframe, 0    	# REG FRAME 0
    	focus   1, 3        	# focus on prodhi
	add    	3, 2        	# prodlo += ABlo (overflow into prodhi)
    	otype   ovrflw, 0    	# prodhi++ if overflow
    	jumpif  2, 3        	# reloop
    	incdec  1, 0, 0    	# i++ (nop slot)
    	
END2($J3):
    	otype	rframe, 1    	# REG FRAME 1
    	focus   1, 0        	# ptr = 4
    	lower   4
    	upper   0
    	store   0, 3        	# MEM[ptr=4] <= $reg1(prodhi)

    	otype   rframe, 0    	# REG FRAME 0
    	focus   0, 0        	# ptr = 5
    	lower   5
    	upper   0
    	store   0, 3        	# MEM[ptr=5] <= $reg1(prodlo)

    	otype   halt        	# party’s over, everyone go home
