module mux4_1(
	input [7:0] a_i,		// Input A
	input [7:0] b_i,		// Input B
	input [7:0] c_i,		// Input C
	input [7:0] d_i,		// Input d
	input [1:0] sig_i,	// 2 Bit Selector
	output [7:0] res_o);	// Output result
	

assign res_o = (sig_i == 0) ? a_i : (sig_i == 1) ? b_i : (sig_i == 2) ? c_i : d_i;

endmodule