# File: closest_pair.asm
# Description: A program to find the least distance between all pairs of values 
# 		in an array of 20 bytes. All values assumed to be signed 8-bit integers. 
# 		The array of integers starts at location 128. Write the minimum distance
# 		in location 127. (Translated to MIPS (8-Bit FMAT) Assembly)
#		Refer to closest_pair.cpp for C equivalent code.
# Date: 1/18/15

INIT:
        otype	rframe, 0      	# REG FRAME 0
        otype   clear, 0    	# $reg0 = 0 (i) 
        move    1, 0        	# $reg1 = 0 (A)
        move    2, 0        	# $reg2 = 0 (B)
        move    3, 0        	# $reg3 = 0 (min)

!-- Seed $CR
        focus   0, 0        	# size = 147
        lower   3
        upper   9
        seed    0, 0, 1    	# $CR = 147

            !-- Seed $CL, i = 128
        focus   0, 0        	# i = 128
        lower   0
        upper   8
        seed    0, 0, 0		# $CL = &i

!-- Seed $J0(START), $J1(END), $J2(SWAP)
        focus   3, 0        	# $J0(START) line023
        lower   7
        upper   1
        focus   3, 0        	# $J1(END) line034
        lower   2
        upper   2
        focus   3, 0        	# $J2(SWAP) line065
        lower   1
        upper   4

START($J0):
        otype   nset, 1
        jumpif  1, 2        	# goto END if $CL !< $CR
        otype   nop
        load    1, 0        	# $reg1(A) <= mem[i]
        incdec  0, 0, 0    	# i++
        load    2, 0        	# $reg2(B) <= mem[i]
        otype   nset, 0
        jumpif  2, 1        	# goto SWAP if $CL > $CR
        otype   nop
        jumpif  0, 3        	# goto START
        otype   nop
        
END($J1):
        focus   0, 0        	# i = 128
        lower   0
        upper   8
        focus   0, 3        	# min = 255
        lower   15
        upper   15

	!-- Seed $J0(START2), $J1(END2), $J2(SETMIN)
        focus   3, 0        	# $J0(START2) line049
        lower   1
        upper   3
        focus   3, 0        	# $J1(END2) line060
        lower   12
        upper   3
        focus   3, 0        	# $J2(SETMIN) line071
        lower   7
        upper   4

START2($J0):
        load	1, 0        	# load $regA <= mem[i]
        indec   0, 0, 0    	# i++
        load    2, 0        	# load $regB <= mem[i]
        sub    	2, 1        	# $diff <= $regB - $regA, $reg2 = diff
        otype   nset, 0    
        seed    0, 2, 0    	# $CL = diff
        seed    0, 3, 1    	# $CR = min
        jumpif  2, 1        	# goto $J2(SETMIN) if $diff < min
        otype   nop
        jumpif  0, 3        	# goto $J0(START2)
        otype  	nop

END2($J1):        
        focus	0, 0        	# i = 127
        lower   15
        upper   7
        store   0, 3        	# M[127] <= min
        otype   halt        	# Exit

SWAP($J2):
        store	0, 1        	# store mem[i] <= $regA
        incdec  0, 2, 1    	# i--
        store   0, 2        	# store mem[i] <= $regB
        incdec	0, 0, 0    	# i++
        jumpif  0, 3        	# goto START
        otype 	nop

SETMIN:
        sub	2, 1        	# $diff = $regB - $regA
        move    3, 2        	# min <= $diff
        jumpif  0, 3        	# goto START2
        otype   nop
