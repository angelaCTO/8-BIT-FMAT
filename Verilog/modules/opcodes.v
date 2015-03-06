/* File: opcodes.v
 * Description:
 * Authors: Angela To, Frank Mezzatesta
 * Date: 2/6/15
 */

// Should use `define or parameter ?
`define NOP	4'b0000
`define HALT	4'b0000
`define TBD	4'b0000
`define OVRFLW	4'b0000
`define CLEAR	4'b0000
`define	NSET	4'b0000
`define	RFRAME	4'b0000
`define	SFRAME	4'b0000
`define ADD 	4'b0001
`define SUB	4'b0010
`define INCDEC 	4'b0011
`define AND	4'b0100
`define	OR	4'b0101
`define	NOT	4'b0110
`define SEED	4'b0111
`define	MOVE	4'b1000
`define	LOAD	4'b1001
`define	STORE	4'b1010
`define FOCUS	4'b1011
`define LOWER	4'b1100
`define UPPER	4'b1101
`define SHIFT	4'b1110
`define	JUMPIF	4'b1111
