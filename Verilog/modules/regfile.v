`timescale 1ns / 1ps

module regfile (
	input clk,
	input writeEnable_i,		// control, write enable signal indicates whether data can be written
 	input [3:0] regWrite_i,		// WRITE_Register (address) to WRITE to
	input [7:0] dataWrite_i,	// Data to WRITE into Write_Register
	input       ovrflw_i,        	// condition register {overflow)
       
	output reg [7:0] register0_o,
	output reg [7:0] register1_o,
	output reg [7:0] register2_o,
	output reg [7:0] register3_o,
	output reg [7:0] register4_o,
	output reg [7:0] register5_o,
	output reg [7:0] register6_o,
	output reg [7:0] register7_o,
	output reg       registerN_o,
	output reg [3:0] registerR_o,
	output reg [1:0] registerF_o,
	output reg [3:0] registerCL_o,
	output reg [7:0] registerCR_o,
	output reg [7:0] registerJ0_o,
	output reg [7:0] registerJ1_o,
	output reg [7:0] registerJ2_o,
	output reg [7:0] registerJ3_o,
	output reg [7:0] registerO_o
);

// Register Parameters
parameter DATA_WIDTH = 8;					// 8 Bits
parameter REGISTER_FILE_WIDTH = 16; 			// 16 Registers

// The Register File
reg [DATA_WIDTH - 1:0] register0;
reg [DATA_WIDTH - 1:0] register1;
reg [DATA_WIDTH - 1:0] register2;
reg [DATA_WIDTH - 1:0] register3;
reg [DATA_WIDTH - 1:0] register4;
reg [DATA_WIDTH - 1:0] register5;
reg [DATA_WIDTH - 1:0] register6;
reg [DATA_WIDTH - 1:0] register7;
reg       registerN;
reg [3:0] registerR;
reg [1:0] registerF;
reg [3:0] registerCL;
reg [7:0] registerCR;
reg [7:0] registerJ0;
reg [7:0] registerJ1;
reg [7:0] registerJ2;
reg [7:0] registerJ3;
reg       registerO;

// Zero all the registers on boot
initial begin
	register0 = 0;
	register1 = 0;
	register2 = 0;
	register3 = 0;
	register4 = 0;
	register5 = 0;
	register6 = 0;
	register7 = 0;
	registerR = 0;
	registerN = 0;
	registerF = 0;
	registerCL = 0;
	registerCR = 0;
	registerJ0 = 0;
	registerJ1 = 0;
	registerJ2 = 0;
	registerJ3 = 0;
	registerO =  0;
end



// Write data on positive clock edge
always@(posedge clk) begin
	if (writeEnable_i == 1) begin
		case (regWrite_i)  
			  0:register0   = dataWrite_i;
			  8:register1   = dataWrite_i;
			 16:register2   = dataWrite_i;
			 24:register3   = dataWrite_i;
			 32:register4   = dataWrite_i;
			 40:register5   = dataWrite_i;
			 48:register6   = dataWrite_i;
			 56:register7   = dataWrite_i;
			 64:registerN   = dataWrite_i; // 4 bits 
			 68:registerCL  = dataWrite_i; // 4 bits
			 72:registerCR  = dataWrite_i;
			 80:registerR   = dataWrite_i;
			 88:registerF   = dataWrite_i;
			 96:registerJ0  = dataWrite_i;
			104:registerJ1  = dataWrite_i;
			112:registerJ2  = dataWrite_i;
			120:registerJ3  = dataWrite_i;
		endcase		
		registerO = ovrflw_i;
	end
	// output every register :)
	register0_o  = register0;
	register1_o  = register1;
	register2_o  = register2;
	register3_o  = register3;
	register4_o  = register4;
	register5_o  = register5;
	register6_o  = register6;
	register7_o  = register7;
	registerR_o  = registerR;
	registerN_o  = registerN;
	registerF_o  = registerF;
	registerCL_o = registerCL;
	registerCR_o = registerCR;
	registerJ0_o = registerJ0;
	registerJ1_o = registerJ1;
	registerJ2_o = registerJ2;
	registerJ3_o = registerJ3;
	registerO_o  = registerO;
end



endmodule