/* File: alu_testbench.v 
 * Description:
 * Authors: Angela To, Frank Mezzatesta
 * Date: 2/6/15
 */

`timescale 1ns/1ps
`include opcodes.v

module alu_testbench();

reg clk; // Clock
reg [3:0] opcode, // 4-Bit Opcode
reg [7:0] ovrflw, // Overflow ....... need this?
reg [7:0] a_i // Input #1
reg [7:0] b_i, // Input #2
reg [7:0] zero, // Need this ???
reg [7:0] z_o // Output #1

// Test Unit
alu testALU (
	.clk(clk),
	.opcode(opcode),
	.a_i(a_i),
	.b_i(b_i),
	.zero(zero),
	.z_o(z_o)
);

// Clock 100Mhz
initial begin
	clk = 0;
	forever #10 clk = ~clk;
end

// Begin Tests
initial begin // ..........idk5
end

endmodule
