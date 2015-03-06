/* File: instrROM_testbench.v
 * Description:
 * Authors: Angela To, Frank Mezzatesta
 * Date: 2/6/15
 */

`timescale 1ns / 1ns

module instrROM_testbench();

reg clock; 		// Clock
reg [8:0] pc_i; 	// Program Counter
reg [8:0] data_o; 	// Data Retrieved

// Test Unit
instrROM testROM (
	.pc_i(pc_i),
	.data_o(data_o)
);

// Clock 100Mhz
initial begin
	clock = 0;
	forever #10 clock = ~clock;
end

// Begin Tests
initial begin
	pc_in = 0;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 1;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 2;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 3;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 4;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 5;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 6;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 7;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 8;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 9;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
	#10 pc_i = 10;
	$display("PC_I: %d, DATA: %d",pc_in, data_o);
end
endmodule
