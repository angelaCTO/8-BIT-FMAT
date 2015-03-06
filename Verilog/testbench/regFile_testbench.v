/* File: fileReg_testbench.v
 * Description: Test bench for Register File
 * Authors: Angela To, Frank Mezatessta
 * Date: 2/6/15
 */

`timescale 1ns/1ps

module regfile_testbench();

parameter DATA_WIDTH = 8; 		// 8 Bits Registers
parameter ADDR_WIDTH = 			//TODO; // ? Bit Addresses

reg clk; 				// Clock

reg[DATA_WIDTH-1:0] wen_i; 		// Write Enable control
reg [ADDR_WIDTH-1:0] regRead1_i;	// READ_Register #1 (address) to be READ
reg [ADDR_WIDTH-1:0] regRead2_i;	// READ_Register #2 (address)to be READ
reg [ADDR_WIDTH-1:0] regWrite_i; 	// WRITE_Register (address) to WRITE to
reg [DATA_WIDTH-1:0] dataWrite_i; 	// Data to WRITE into Write_Register
reg [DATA_WIDTH-1:0] dataRead1_o; 	// Data #1, First value read from the register file
reg [DATA_WIDTH-1:0] dataRead2_o; 	// Data #2, Second value read from the register file

// Test Unit
regfile testfile(
	.clk(clk),
	.wen_i(wen_i),
	.regRead1_i(regRead1_i),
	.regRead2_i(regRead2_i),
	.regWrite_i(regWrite_i),
	.dataWrite_i(dataWrite_i),
	.dataRead1_o(dataRead1_o),
	.dataRead2_o(dataRead2_o)
);

// Clock 100Mhz
initial begin
	clk = 0;
	forever #10 clk = ~clk;
	end

// Begin Tests
initial begin 
	regWrite_i <= //TODO b'; 	// Write to Register Address
	dataWrite_i <= 8'b11001100; 	// Write 8 Bits:
	wen_i <= 1'b1; 			// Enable Write
	#5 wen_i <= 1'b0;	 	// Disable Write after 5 time units
	#5 wen_i <= 1'b1; 		// Enable Write after 5 time units
	regWrite_i <= //TODO 'b; 	// Write to Register Address
	dataWrite_i <= 8'b01010101; 	// Write 8 Bits:
	#5 wen_i <= 1'b0; 		// Disable Write after 5 time units
	regWrite_i <= //TODO b'; 	// Write to Register Address
	dataWrite_i <= 8'b11111111; 	// Write 8 Bits:
	regRead1_i <= //TODO 'b; 	// Read Register Address
	regRead2_i <= //TODO 'b; 	// Read Register Address
end
endmodule
