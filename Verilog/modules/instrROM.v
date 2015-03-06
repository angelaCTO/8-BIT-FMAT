`timescale 1ns / 1ps

module inst_rom (
	//input clck,
	//input reset,
	input [7:0] pc_i,		
	output reg [7:0] instr_o
);

always@(*) begin 	// always * ?
	case (pc_i)
		// PROGRAM 1 - PRODUCT 
		2'h00: instr_o = 8'b00001100;	// otype rframe 0
		2'h01: instr_o = 8'b00001000;	// otype clear 0
		2'h02: instr_o = 8'b10001000;	// move 2 0
		2'h03: instr_o = 8'b10001100;	// move 3 0
		2'h04: instr_o = 8'b00110000;	// incdec 0 0 0 
		2'h05: instr_o = 8'b00001101;	// otype rframe 1
		2'h06: instr_o = 8'b00001000;	// otype clear 0
		2'h07: instr_o = 8'b01111000;	// seed 1 0 0
		2'h08: instr_o = 8'b10001000;	// move 2 0 
		2'h09: instr_o = 8'b10001100;	// move 3 0
		2'h0A: instr_o = 8'b00001100;	// otype rframe 0
		2'h0B: instr_o = 8'b10010100;	// load 1 0
		2'h0C: instr_o = 8'b00110000;	// incdec 0 0 0 
		2'h0D: instr_o = 8'b01110011;	// seed 0 1 1
		2'h0E: instr_o = 8'b10010100;	// load 1 0
		2'h0F: instr_o = 8'b00110000;	// incdec 0 0 0 
		//-- Set up conditional negation flag
		2'h10: instr_o = 8'b00001011;	// otype nset 1
		//-- Set jump(to) addresses
		2'h11: instr_o = 8'b10111100;	// focus 3 0
		2'h12: instr_o = 8'b11010001;	// upper 1
		2'h13: instr_o = 8'b11001000;	// lower 8 
		2'h14: instr_o = 8'b10111101;	// focus 3 1 
		2'h13: instr_o = 8'b11010001;	// upper 1
		2'h14: instr_o = 8'b11001110;	// lower 14
		//-- Setup overflow target
		2'h15: instr_o = 8'b10110110;	// focus 1 2 
		//-- LOOP1 $J0
		2'h16: instr_o = 8'b11110110;	// jumpif 1 2
		2'h17: instr_o = 8'b00000000;	// otype nop
		2'h18: instr_o = 8'b00011001;	// add 2 1
		2'h19: instr_o = 8'b00000110;	// otype ovrflw 0 
		2'h1A: instr_o = 8'b11110011; // jumpif 0 3
		2'h1B: instr_o = 8'b00111000;	// incdec 1 0 0
		//-- END1 $J1
		2'h1C: instr_o = 8'b10010100;	// load 1 0
		2'h1D: instr_o = 8'b00110000;	// incdec 0 0 0  
		2'h1E: instr_o = 8'b01110011; // seed 0 1 1
		2'h1F: instr_o = 8'b00001101;	// otype rframe 1
		2'h20: instr_o = 8'b00001000;	// otype clear 0
		2'h21: instr_o = 8'b00001100;	// otype rframe 0 
		//-- Setup jump(to) addresses
		2'h22: instr_o = 8'b10111110; // focus 3 2
		2'h23: instr_o = 8'b11010010;	// upper 2
		2'h24: instr_o = 8'b11001010;	// lower 10
		2'h25: instr_o = 8'b10111111;	// focus 3 3 
		2'h26: instr_o = 8'b11010011; // upper 3
		2'h27: instr_o = 8'b11000100;	// lower 4
		//-- LOOP2 $J2
		2'h28: instr_o = 8'b11111110;	// jumpif 3 2
		2'h29: instr_o = 8'b00000000;	// otype nop 
		2'h2A: instr_o = 8'b00001101; // otype rframe 1
		2'h2B: instr_o = 8'b00011110;	// add 3 2
		2'h2C: instr_o = 8'b00001100;	// otype rframe 0
		2'h2D: instr_o = 8'b10110111;	// focus 1 3 
		2'h2E: instr_o = 8'b00011110;	// add 3 2
		2'h2F: instr_o = 8'b00000110;	// otype ovrflw 0
		2'h30: instr_o = 8'b11111011;	// jumpif 2 3
		2'h31: instr_o = 8'b00111000;	// incdec 1 0 0 
		//-- END2 $J2
		2'h32: instr_o = 8'b00001101;	// otype rframe 1
		2'h33: instr_o = 8'b10110100;	// focus 1 0
		2'h34: instr_o = 8'b11000100;	// lower 4
		2'h35: instr_o = 8'b11010000;	// upper 0 
		2'h36: instr_o = 8'b10100011;	// store 0 3
		2'h37: instr_o = 8'b00001100;	// otype rframe 0
		2'h38: instr_o = 8'b10110000;	// focus 0 0
		2'h39: instr_o = 8'b11000101;	// lower 5
		2'h3A: instr_o = 8'b11010000;	// upper 0 
		2'h3B: instr_o = 8'b10100011;	// store 0 3
		2'h3C: instr_o = 8'b00000010;	// otype halt
		
		
		// PROGRAM 2 - STRING MATCH 
		2'h3D: instr_o = 8'b00001100;	// otype rframe 0
		2'h3E: instr_o = 8'b00001000;	// otype clear 0
		2'h3F: instr_o = 8'b10000100;	// move 1 0
		2'h40: instr_o = 8'b10001000;	// move 2 0
		2'h41: instr_o = 8'b10001100;	// move 3 0
		2'h42: instr_o = 8'b00001101;	// otype rframe 1
		2'h43: instr_o = 8'b00001000;	// otype clear 0
		2'h44: instr_o = 8'b10000100;	// move 1 0 
		//-- Store length of bit stream into $reg4
		2'h45: instr_o = 8'b10110100;	// focus 1 0 
		2'h46: instr_o = 8'b11010111;	// upper 3
		2'h47: instr_o = 8'b11001101;	// lower 13
		//-- Load pattern string from memory into $CL
		2'h48: instr_o = 8'b10110000;	// focus 0 0
		2'h49: instr_o = 8'b11000110;	// lower 6 
		2'h4A: instr_o = 8'b10010100;	// load 1 0
		2'h4B: instr_o = 8'b10110100;	// focus 1 0
		2'h4C: instr_o = 8'b11010000;	// upper 0
		//-- Initialize ptr = M[32], increment onwards
		2'h4D: instr_o = 8'b00001000;	// otype clear 0 
		2'h4E: instr_o = 8'b10110000;	// focus 0 0 
		2'h4F: instr_o = 8'b11010010;	// upper 2
		//-- Set jump(to) addresses 
		2'h50: instr_o = 8'b10111100;	// focus 3 0 
		2'h51: instr_o = 8'b11010001;	// upper 1 
		2'h52: instr_o = 8'b11001101;	// lower 13
		2'h53: instr_o = 8'b10111101;	// focus 3 1
		2'h54: instr_o = 8'b11010010;	// upper 2 
		2'h55: instr_o = 8'b11001101;	// lower 13
		2'h56: instr_o = 8'b10111110;	// focus 3 2
		2'h57: instr_o = 8'b11010010;	// upper 2
		2'h58: instr_o = 8'b11000110;	// lower 6 
		2'h59: instr_o = 8'b01110000; // seed 1 0 0
		//-- WHILE $J0
		2'h5A: instr_o = 8'b11110100;	// jumpif 1 0
		2'h5B: instr_o = 8'b01110000;	// seed 1 0 0
		2'h5C: instr_o = 8'b10011000;	// load 2 0  
		2'h5D: instr_o = 8'b10110010; // focus 0 2
		2'h5E: instr_o = 8'b01110101;	// seed 0 2 1
		2'h5F: instr_o = 8'b11101001;	// shift 4 1
		2'h60: instr_o = 8'b00001011;	// otype nset 1 
		2'h61: instr_o = 8'b11111000; // jumpif 2 0
		2'h62: instr_o = 8'b00111010;	// incdec 1 1 0
		//-- SKIP $J2
		2'h63: instr_o = 8'b00001100;	// otype rframe 0
		2'h64: instr_o = 8'b00110000;	// incdec 0 0 
		2'h65: instr_o = 8'b00110110; // incdec 0 3 0
		2'h66: instr_o = 8'b11110011;	// jumpif 0 3
		2'h67: instr_o = 8'b01111000;	// seed 1 0 0 
		//-- END_WHILE $J1
		2'h68: instr_o = 8'b00001101;	// otype rframe 1
		2'h69: instr_o = 8'b10110110; // focus 1 2 
		2'h6A: instr_o = 8'b11001001;	// lower 7
		2'h6B: instr_o = 8'b10101001;	// store 2 1
		2'h6C: instr_o = 8'b00000000;	// halt
	/*
		// PROGRAM 3 - CLOSEST PAIR
		2'h6D: instr_o = 8'b00011110;	// 
		2'h6E: instr_o = 8'b00000110;	// 
		2'h6F: instr_o = 8'b11111011;	// 
		2'h70: instr_o = 8'b00111000;	//  
		2'h71: instr_o = 8'b00001101;	// 
		2'h72: instr_o = 8'b10110100;	// 
		2'h73: instr_o = 8'b11000100;	// 
		2'h74: instr_o = 8'b11010000;	// 
		2'h75: instr_o = 8'b10100011;	// 
		2'h76: instr_o = 8'b00001100;	// 
		2'h77: instr_o = 8'b10110000;	// 
		2'h78: instr_o = 8'b11000101;	// 
		2'h79: instr_o = 8'b11010000;	// 
		2'h7A: instr_o = 8'b10100011;	// 
		2'h7B: instr_o = 8'b00000010;	//
		2'h7C: instr_o = 8'b00001100;	// 
		2'h7D: instr_o = 8'b00001000;	// 
		2'h7E: instr_o = 8'b10001000;	// 
		2'h7F: instr_o = 8'b10001100;	// 
		2'h80: instr_o = 8'b00110000;	//  
		2'h81: instr_o = 8'b00001101;	// 
		2'h82: instr_o = 8'b00001000;	// 
		2'h83: instr_o = 8'b01111000;	// 
		2'h84: instr_o = 8'b10001000;	//  
		2'h85: instr_o = 8'b10001100;	// 
		2'h86: instr_o = 8'b00001100;	// 
		2'h87: instr_o = 8'b10010100;	// 
		2'h88: instr_o = 8'b00110000;	//  
		2'h89: instr_o = 8'b01110011;	// 
		2'h8A: instr_o = 8'b10010100;	// 
		2'h8B: instr_o = 8'b00110000;	//  
		2'h8C: instr_o = 8'b00001011;	//  
		2'h8D: instr_o = 8'b10111100;	// 
		2'h8E: instr_o = 8'b11010001;	// 
		2'h8F: instr_o = 8'b11001000;	// 
		2'h90: instr_o = 8'b10111101;	//  
		2'h91: instr_o = 8'b11010001;	// 
		2'h92: instr_o = 8'b11001110;	// 
		2'h93: instr_o = 8'b10110110;	//  
		2'h94: instr_o = 8'b11110110;	// 
		2'h95: instr_o = 8'b00000000;	// 
		2'h96: instr_o = 8'b00011001;	// 
		2'h97: instr_o = 8'b00000110;	// 
		2'h98: instr_o = 8'b11110011; // 
		2'h99: instr_o = 8'b00111000;	//
		2'h9A: instr_o = 8'b10010100;	// 
		2'h9B: instr_o = 8'b00110000;	// 
		2'h9C: instr_o = 8'b01110011; // 
		2'h9D: instr_o = 8'b00001101;	//
		2'h9E: instr_o = 8'b00001000;	// 
		2'h9F: instr_o = 8'b00001100;	//
		2'hA0: instr_o = 8'b10111110; //
		2'hA1: instr_o = 8'b11010010;	// 
		2'hA2: instr_o = 8'b11001010;	// 
		2'hA3: instr_o = 8'b10111111;	// 
		2'hA4: instr_o = 8'b11010011; // 
		2'hA5: instr_o = 8'b11000100;	// 
		2'hA6: instr_o = 8'b11111110;	// 
		2'hA7: instr_o = 8'b00000000;	//
		2'hA8: instr_o = 8'b00001101; // 
		2'hA9: instr_o = 8'b00011110;	// 
		2'hAA: instr_o = 8'b00001100;	// 
		2'hAB: instr_o = 8'b10110111;	//  
		2'hAC: instr_o = 8'b00011110;	// 
		2'hAD: instr_o = 8'b00000110;	// 
		2'hAE: instr_o = 8'b11111011;	// 
		2'hAF: instr_o = 8'b00111000;	// 
		2'hB0: instr_o = 8'b00001101;	// 
		2'hB1: instr_o = 8'b10110100;	// 
		2'hB2: instr_o = 8'b11000100;	// 
		2'hB3: instr_o = 8'b11010000;	//
		2'hB4: instr_o = 8'b10100011;	//
		2'hB5: instr_o = 8'b00001100;	//
		2'hB6: instr_o = 8'b10110000;	// 
		2'hB7: instr_o = 8'b11000101;	// 
		2'hB8: instr_o = 8'b11010000;	// 
		2'hB9: instr_o = 8'b10100011;	//
		2'hBA: instr_o = 8'b00000010;	//		
		2'h3D: instr_o = 8'b00001100;	// 
		2'hBB: instr_o = 8'b00001000;	// 
		2'hBC: instr_o = 8'b10001000;	// 
		2'hBD: instr_o = 8'b10001100;	// 
		2'hBE: instr_o = 8'b00110000;	// 
		2'hBF: instr_o = 8'b00001101;	//
		2'hC0: instr_o = 8'b00001000;	//
		2'hC1: instr_o = 8'b01111000;	//
		2'hC2: instr_o = 8'b10001000;	//
		2'hC3: instr_o = 8'b10001100;	//
		2'hC4: instr_o = 8'b00001100;	//
		2'hC5: instr_o = 8'b10010100;	//
		2'hC6: instr_o = 8'b00110000;	// 
		2'hC7: instr_o = 8'b01110011;	// 
		2'hC8: instr_o = 8'b10010100;	// 
		2'hC9: instr_o = 8'b00110000;	// 
		2'hCA: instr_o = 8'b00001011;	// 
		2'hCB: instr_o = 8'b10111100;	// 
		2'hCC: instr_o = 8'b11010001;	// 
		2'hCD: instr_o = 8'b11001000;	//  
		2'hCE: instr_o = 8'b10111101;	// 
		2'hCF: instr_o = 8'b11010001;	// 
		2'hD0: instr_o = 8'b11001110;	// 
		2'hD1: instr_o = 8'b10110110;	// 
		2'hD2: instr_o = 8'b11110110;	// 
		2'hD3: instr_o = 8'b00000000;	// 
		2'hD4: instr_o = 8'b00011001;	// 
		2'hD5: instr_o = 8'b00000110;	// 
		2'hD6: instr_o = 8'b11110011; // 
		2'hD7: instr_o = 8'b00111000;	// 
		2'hD8: instr_o = 8'b10010100;	// 
		2'hD9: instr_o = 8'b00110000;	// 
		2'hDA: instr_o = 8'b01110011; // 
		2'hDB: instr_o = 8'b00001101;	// 
		2'hDC: instr_o = 8'b00001000;	// 
		2'hDD: instr_o = 8'b00001100;	// 
		2'hDE: instr_o = 8'b10111110; // 
		2'hDF: instr_o = 8'b11010010;	// 
		2'hE0: instr_o = 8'b11001010;	// 
		2'hE1: instr_o = 8'b10111111;	// 
		2'hE2: instr_o = 8'b11010011; // 
		2'hE3: instr_o = 8'b11000100;	// 
		2'hE4: instr_o = 8'b11111110;	// 
		2'hE5: instr_o = 8'b00000000;	// 
		2'hE6: instr_o = 8'b00001101; // 
		2'hE7: instr_o = 8'b00011110;	// 
		2'hE8: instr_o = 8'b00001100;	// 
		2'hE9: instr_o = 8'b10110111;	// 
		2'hEA: instr_o = 8'b00011110;	// 
		2'hEB: instr_o = 8'b00000110;	// 
		2'hEC: instr_o = 8'b11111011;	// 
		2'hED: instr_o = 8'b00111000;	// 
		2'hEE: instr_o = 8'b00001101;	// 
		2'hEF: instr_o = 8'b10110100;	// 
		2'hF0: instr_o = 8'b11000100;	// 
		2'hF1: instr_o = 8'b11010000;	// 
		2'hF2: instr_o = 8'b10100011;	// 
		2'hF3: instr_o = 8'b00001100;	// 
		2'hF4: instr_o = 8'b10110000;	// 
		2'hF5: instr_o = 8'b11000101;	// 
		2'hF6: instr_o = 8'b11010000;	// 
		2'hF7: instr_o = 8'b10100011;	// 
		2'hF8: instr_o = 8'b00000010;	//
		2'hF9: instr_o = 8'b00111000;	// 
		2'hFA: instr_o = 8'b00001101;	// 
		2'hFB: instr_o = 8'b10110100;	// 
		2'hFC: instr_o = 8'b11000100;	// 
		2'hFD: instr_o = 8'b11010000;	// 
		2'hFF: instr_o = 8'b10100011;	// LINE 255
*/
	endcase
end
endmodule
