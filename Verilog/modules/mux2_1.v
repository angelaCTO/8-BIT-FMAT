module mux2_1 (
	input [7:0] a_i,		// Input A
	input [7:0] b_i,		// Input B
	input sig_i,			// 1 Bit Selector
	output [7:0] res_o);		// Output result
	
assign res_o = sig_i ? a_i : b_i;

endmodule