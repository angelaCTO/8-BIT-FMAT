  `timescale 1ns / 1ps

`define ALU_ADD     4'b0000
`define ALU_SUB     4'b0001
`define ALU_AND     4'b0010
`define ALU_OR      4'b0011
`define ALU_NOT     4'b0100
`define ALU_LSHIFT  4'b0101
`define ALU_RSHIFT  4'b0110
`define ALU_LESS    4'b0111
`define ALU_EQUAL   4'b1000
`define ALU_GREATER 4'b1001

module fmat_alu ( 
	input clk,						// Clock
	input[3:0]  alu_opcode_i,	// 4-Bit Opcode
	input[7:0]  a_i,				// Input #1 
	input[7:0]  b_i,				// Input #2
	output reg[7:0] z_o,			// Output #1
	output reg  ovrflw_o 		// Overflow output
);

always @(*) begin 
	case(alu_opcode_i)
		`ALU_ADD: {ovrflw_o,z_o} =  a_i + b_i;
		`ALU_SUB: {ovrflw_o,z_o} =  a_i - b_i;
		`ALU_AND:           z_o  =  a_i & b_i;
		`ALU_OR:            z_o  =  a_i | b_i;
		`ALU_NOT:           z_o  = ~a_i;
		`ALU_LSHIFT:        z_o  =  a_i << b_i;
		`ALU_RSHIFT:        z_o  =  a_i >> b_i;
		`ALU_LESS:          z_o  =  a_i < b_i;
		`ALU_EQUAL:         z_o  =  a_i == b_i;
		`ALU_GREATER:       z_o  =  a_i > b_i;
		default:            z_o  =  8'b00000000;
	endcase
end

endmodule