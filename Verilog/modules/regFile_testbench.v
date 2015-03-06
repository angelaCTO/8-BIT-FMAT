/* File: fileReg_testbench.v
 * Description: Test bench for Register File
 * Authors: Angela To, Frank Mezatessta
 * Date: 2/6/15
 */

`timescale 1ns/1ps

module regfile_testbench();

parameter DATA_WIDTH = 8; 				// 8 Bits Registers
parameter ADDR_WIDTH = 4;				// 4 Bit Addresses		

reg clk; 									// Clock

reg [ADDR_WIDTH-1:0] regRead1_i;		// READ_Register #1 (address) to be READ
reg [ADDR_WIDTH-1:0] regRead2_i;		// READ_Register #2 (address)to be READ
reg [ADDR_WIDTH-1:0] regRead3_i;		// READ_Register #1 (address) to be READ
reg [ADDR_WIDTH-1:0] regRead4_i;		// READ_Register #2 (address)to be READ
reg writeEnable_i; 						// Write Enable control
reg [ADDR_WIDTH-1:0] regWrite_i; 	// WRITE_Register (address) to WRITE to
reg [DATA_WIDTH-1:0] dataWrite_i; 	// Data to WRITE into Write_Register
reg ovrflw_i;								// Condition Register (Overflow)
wire [DATA_WIDTH-1:0] dataRead1_o; 	// Data #1, First value read from the register file
wire [DATA_WIDTH-1:0] dataRead2_o; 	// Data #2, Second value read from the register file
wire [DATA_WIDTH-1:0] dataRead3_o; 	// Data #1, First value read from the register file
wire [DATA_WIDTH-1:0] dataRead4_o; 	// Data #2, Second value read from the register file
wire ovrflw_o;

// Begin Tests
initial begin
	#10 writeEnable_i = 1'b1; 	// Enable Write after 10 time units
	regWrite_i = 4'b0001; 			// Write to Register 1
	dataWrite_i = 8'b00000001; 	// Write 8 Bits(1) to Register 1
	
	ovrflw_i = 1'b0;
   #10 writeEnable_i = 1'b0; 	
	
	#10 writeEnable_i = 1'b1; 	// Disable Write after 10 time units
	regWrite_i = 4'b0010; 			// Write to Register 2
	dataWrite_i = 8'b00000010; 	// Write 8 Bits(2) to Register 2

	ovrflw_i = 1'b1;
   #10 writeEnable_i = 1'b0; 	
	
	#10 writeEnable_i = 1'b1; 		// Disable Write after 10 time units
	regWrite_i = 4'b0100; 			// Write to Register 3
	dataWrite_i = 8'b00000011; 	// Write 8 Bits(3) to Register 3
	
	#10 writeEnable_i = 1'b0; 	
	
	regRead1_i = 4'b0000; 			// Read Register 0
	regRead2_i = 4'b0001; 			// Read Register 1
	regRead1_i = 4'b0010; 			// Read Register 2
	regRead2_i = 4'b0011; 			// Read Register 3
	
// -------------------------------------------------------------------//
	#10 writeEnable_i = 1'b1; 		// Enable Write after 10 time units
	regWrite_i = 4'b0100; 			// Write to Register 4
	dataWrite_i = 8'b00000100; 	// Write 8 Bits(4) to Register 4
	
	ovrflw_i = 1'b0;	
	
	#10 writeEnable_i = 1'b1; 		// Disable Write after 10 time units
	regWrite_i = 4'b0101; 			// Write to Register 5
	dataWrite_i = 8'b00000101; 	// Write 8 Bits(2) to Register 5

	ovrflw_i = 1'b0;
	#10 writeEnable_i = 1'b0; 	
	
	#10 writeEnable_i = 1'b1; 		// Disable Write after 10 time units
	regWrite_i = 4'b0110; 			// Write to Register 6
	dataWrite_i = 8'b00000110; 	// Write 8 Bits(6) to Register 6

	#10 writeEnable_i = 1'b1; 		// Disable Write after 10 time units
	regWrite_i = 4'b0111; 			// Write to Register 7
	dataWrite_i = 8'b00000111; 	// Write 8 Bits(6) to Register 7
	
   #10 writeEnable_i = 1'b0; 	
	
	regRead1_i = 4'b0100; 			// Read Register 4
	regRead2_i = 4'b0101; 			// Read Register 5
	regRead1_i = 4'b0110; 			// Read Register 6
	regRead2_i = 4'b0111; 			// Read Register 3	
end

// Clock generator
always begin
   #10  clk = ~clk; 	
end


// Test Unit
regfile b2v_inst(
	.clk(clk),
	.regRead1_i(regRead1_i),
	.regRead2_i(regRead2_i),
	.regRead3_i(regRead3_i),
	.regRead4_i(regRead4_i),	
	.writeEnable_i(writeEnable_i),
	.regWrite_i(regWrite_i),
	.dataWrite_i(dataWrite_i),
	.ovrflw_i(ovrflw_i),
	.dataRead1_o(dataRead1_o),
	.dataRead2_o(dataRead2_o),
	.dataRead3_o(dataRead3_o),
	.dataRead4_o(dataRead4_o),
	.ovrflw_o(ovrflw_o)
);

endmodule
