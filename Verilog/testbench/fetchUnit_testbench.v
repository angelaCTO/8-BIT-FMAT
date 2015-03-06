/* File: fetchUnit_testbench.v
 * Description:
 * Authors: Angela To, Frank Mezzatesta
 * Date: 2/6/15
 */

//TODO
module alu_testbench();

reg clk; // Clock

regfile testFetch(
	.clk(clk),
);

// Clock 100Mhz
initial begin
	clk = 0;
	forever #10 clk = ~clk;
end

// Begin Tests
initial begin 
end

endmodule
