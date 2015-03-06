module fetchUnit(
	input clk,					// Clock 
	input halt_i,				// Halt condition
	input start_i,				// Flag: whether to jump to the start address
	input [7:0] start_addr_i,	// the address of the beginning of the program
	input [7:0] target_i,	// Target address to jump to
	input       yesJump_i,
	output reg [7:0] pc_o	// Program Counter Output
);

reg [7:0] program_counter;

initial begin
	program_counter = 0;
	pc_o = program_counter;
end

always@(posedge clk) begin	
	if (start_i == 1) program_counter = start_addr_i;
	else if (yesJump_i) program_counter = target_i;
	else program_counter = program_counter + 1;
	
	if (halt_i == 0) pc_o = program_counter;
end

endmodule
