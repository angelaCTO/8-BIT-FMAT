# File: string_match.asm
# Description: A program that finds the number of entries in an array which 
#		contains a 4-bit string. For example, if the string is 0101, then 
#		11010110  would count. The array starts at position 32 and is 64 bytes 
#		long. The string you search for will be in the lower 4 bits of memory 
#		address 6. The result should be written to location 7.
#		Refer to string_match.cpp for equivalent C code
# Author: Angela To, Frank Mezzatesta
# Date: 1/23/15

INIT:
        otype	rframe, 0	# $F= 0
        otype 	clear, 0     	# $reg0 = 0 (ptr) 
        move    1, 0        	# $reg1 = 0 (pattern)
        move    2, 0        	# $reg2 = 0 (byte)
        move    3, 0        	# $reg3 = 0 (i)
        otype   rframe, 1    	# $F=1
        otype 	clear, 0    	# $reg4 = 0 (length)
        mov     1, 0        	# $reg5 = 0 (hits)

	!-- Store length of bit stream into $reg4
        focus	1, 0
        upper   3        	# $reg4 = 64 - 3 ….can we just hardcode this ? pls
        lower   13

            !-- Load pattern string from memory into $CL, located in M[6] (lower 4 bits)
        focus	0, 0 
        lower   6        	# $reg0(ptr) = 6
        load    1, 0        	# $reg1 = M[ptr=6]
        focus   1, 0    
        upper   0        	# $reg1 = 0000 xxxx, get 4 lower bits of M[6]

        !-- Initialize ptr = M[32], increment onwards
        otype	clear, 0    	# Reset $reg0 (ptr)
        focus   0, 0             
        upper   2        	# $reg0(ptr) = 32

            !-- Set jump(to) addresses (LABELS)
        focus	3, 0		# Set $F[0] = &WHILE (line 029)
        upper	1
        lower	13
        focus	3, 1        	# Set $F[1] = &END_WHILE (line 43)
        upper	2
        lower	13
        focus	3, 2        	# Set $F[2] = &SKIP_IF (line 38)
        upper	2
        lower	6
        seed	1, 0, 0    	# $CL = $reg4

WHILE($J0): 
        jumpif	1, 0         	# Break if  i =(>)  (bit_string_length-3), go to END_WHILE
        seed	1, 0, 0    	# $CL <= $reg1(pattern), nop place

	!-- Now, get 4 bits from bit string starting from M[ptr] 
        load	2, 0        	# $reg2 <= M[ptr], $reg2 now holds first byte of bit_string
        focus	0, 2
        seed	0, 2, 1    	# $CR = $reg2 
        shift	4, 1        	# $reg <= $reg2>>4
    
	!-- Compare $CL, $CR, increment hits if a match    
        otype	nset, 1    	# Negate comparison 
        jumpif 	2, 0        	# if $CL (!)= $CR, goto SKIP_IF
        incdec 	1, 1, 0     	# Else, we have a match! num_hit++, nop place

SKIP_IF($J2):
        !-- Increment i, ptr
        otype	rframe, 0    	# $F = 0
        incdec 	0, 0, 0 	# $reg4(i)i++
        incdec 	0, 3, 0    	# $reg0(ptr)++ 
    
        !-- Reset i as the left comparison value
        jumpif 	0, 3        	# Reloop
        seed	1, 0, 0    	# $CL = $reg4, nop place

END_WHILE($J1):
        otype rframe, 1
        focus 1, 2
        lower 7			# Store $reg5(hits) into M[7]
        store 2, 1        	# M[7] <= $reg5(hits)
        halt            	# EOP, exit
