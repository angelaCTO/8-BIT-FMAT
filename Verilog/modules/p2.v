// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"
// CREATED		"Sun Feb 22 21:51:03 2015"

module p2(
	clk,
	start_i,
	start_addr_i,
	writeEnable_o,
	yesJump_o,
	halt_o,
	dataWrite_o,
	instr_o,
	pc_o,
	regWrite_o,
	target_o
);


input wire	clk;
input wire	start_i;
input wire	[7:0] start_addr_i;
output wire	writeEnable_o;
output wire	yesJump_o;
output wire	halt_o;
output wire	[7:0] dataWrite_o;
output wire	[7:0] instr_o;
output wire	[7:0] pc_o;
output wire	[3:0] regWrite_o;
output wire	[7:0] target_o;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_42;
wire	[7:0] SYNTHESIZED_WIRE_43;
wire	[1:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	[3:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[7:0] SYNTHESIZED_WIRE_23;
wire	[7:0] SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	[7:0] SYNTHESIZED_WIRE_28;
wire	[7:0] SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	[7:0] SYNTHESIZED_WIRE_31;
wire	[3:0] SYNTHESIZED_WIRE_32;
wire	[7:0] SYNTHESIZED_WIRE_33;
wire	[1:0] SYNTHESIZED_WIRE_34;
wire	[7:0] SYNTHESIZED_WIRE_35;
wire	[7:0] SYNTHESIZED_WIRE_36;
wire	[7:0] SYNTHESIZED_WIRE_37;
wire	[7:0] SYNTHESIZED_WIRE_38;
wire	[7:0] SYNTHESIZED_WIRE_39;
wire	[3:0] SYNTHESIZED_WIRE_40;
wire	[7:0] SYNTHESIZED_WIRE_41;

assign	writeEnable_o = SYNTHESIZED_WIRE_14;
assign	yesJump_o = SYNTHESIZED_WIRE_1;
assign	halt_o = SYNTHESIZED_WIRE_0;
assign	dataWrite_o = SYNTHESIZED_WIRE_16;
assign	instr_o = SYNTHESIZED_WIRE_23;
assign	pc_o = SYNTHESIZED_WIRE_41;
assign	regWrite_o = SYNTHESIZED_WIRE_17;
assign	target_o = SYNTHESIZED_WIRE_2;




fetchUnit	b2v_inst(
	.clk(clk),
	.halt_i(SYNTHESIZED_WIRE_0),
	.start_i(start_i),
	.yesJump_i(SYNTHESIZED_WIRE_1),
	.start_addr_i(start_addr_i),
	.target_i(SYNTHESIZED_WIRE_2),
	.pc_o(SYNTHESIZED_WIRE_41));

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;


mux4_1	b2v_inst12(
	.a_i(SYNTHESIZED_WIRE_5),
	.b_i(SYNTHESIZED_WIRE_42),
	.c_i(SYNTHESIZED_WIRE_43),
	.d_i(SYNTHESIZED_WIRE_43),
	.sig_i(SYNTHESIZED_WIRE_9),
	.res_o(SYNTHESIZED_WIRE_16));


fmat_alu	b2v_inst13(
	.clk(clk),
	.a_i(SYNTHESIZED_WIRE_10),
	.alu_opcode_i(SYNTHESIZED_WIRE_11),
	.b_i(SYNTHESIZED_WIRE_12),
	.ovrflw_o(SYNTHESIZED_WIRE_15),
	.z_o(SYNTHESIZED_WIRE_42));


to_flag	b2v_inst3(
	.input_i(SYNTHESIZED_WIRE_42),
	.output_o(SYNTHESIZED_WIRE_3));


regfile	b2v_inst5(
	.clk(clk),
	.writeEnable_i(SYNTHESIZED_WIRE_14),
	.ovrflw_i(SYNTHESIZED_WIRE_15),
	.dataWrite_i(SYNTHESIZED_WIRE_16),
	.regWrite_i(SYNTHESIZED_WIRE_17),
	.registerN_o(SYNTHESIZED_WIRE_22),
	.register0_o(SYNTHESIZED_WIRE_24),
	.register1_o(SYNTHESIZED_WIRE_25),
	.register2_o(SYNTHESIZED_WIRE_26),
	.register3_o(SYNTHESIZED_WIRE_27),
	.register4_o(SYNTHESIZED_WIRE_28),
	.register5_o(SYNTHESIZED_WIRE_29),
	.register6_o(SYNTHESIZED_WIRE_30),
	.register7_o(SYNTHESIZED_WIRE_31),
	.registerCL_o(SYNTHESIZED_WIRE_32),
	.registerCR_o(SYNTHESIZED_WIRE_33),
	.registerF_o(SYNTHESIZED_WIRE_34),
	.registerJ0_o(SYNTHESIZED_WIRE_35),
	.registerJ1_o(SYNTHESIZED_WIRE_36),
	.registerJ2_o(SYNTHESIZED_WIRE_37),
	.registerJ3_o(SYNTHESIZED_WIRE_38),
	.registerO_o(SYNTHESIZED_WIRE_39),
	.registerR_o(SYNTHESIZED_WIRE_40));
	defparam	b2v_inst5.DATA_WIDTH = 8;
	defparam	b2v_inst5.REGISTER_FILE_WIDTH = 16;


single_port_ram_with_init	b2v_inst6(
	.writemem(SYNTHESIZED_WIRE_18),
	.readmem(SYNTHESIZED_WIRE_19),
	.clk(clk),
	.addr(SYNTHESIZED_WIRE_20),
	.data(SYNTHESIZED_WIRE_21),
	.q(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst6.ADDR_WIDTH = 8;


control	b2v_inst7(
	.registerN_i(SYNTHESIZED_WIRE_22),
	.instr_i(SYNTHESIZED_WIRE_23),
	.register0_i(SYNTHESIZED_WIRE_24),
	.register1_i(SYNTHESIZED_WIRE_25),
	.register2_i(SYNTHESIZED_WIRE_26),
	.register3_i(SYNTHESIZED_WIRE_27),
	.register4_i(SYNTHESIZED_WIRE_28),
	.register5_i(SYNTHESIZED_WIRE_29),
	.register6_i(SYNTHESIZED_WIRE_30),
	.register7_i(SYNTHESIZED_WIRE_31),
	.registerCL_i(SYNTHESIZED_WIRE_32),
	.registerCR_i(SYNTHESIZED_WIRE_33),
	.registerF_i(SYNTHESIZED_WIRE_34),
	.registerJ0_i(SYNTHESIZED_WIRE_35),
	.registerJ1_i(SYNTHESIZED_WIRE_36),
	.registerJ2_i(SYNTHESIZED_WIRE_37),
	.registerJ3_i(SYNTHESIZED_WIRE_38),
	.registerO_i(SYNTHESIZED_WIRE_39),
	.registerR_i(SYNTHESIZED_WIRE_40),
	.halt_o(SYNTHESIZED_WIRE_0),
	
	.writeEnable_o(SYNTHESIZED_WIRE_18),
	.readEnable_o(SYNTHESIZED_WIRE_19),
	.regfileWriteEnable_o(SYNTHESIZED_WIRE_14),
	.jumpAttempt_o(SYNTHESIZED_WIRE_4),
	.A_o(SYNTHESIZED_WIRE_10),
	.aluOpcode_o(SYNTHESIZED_WIRE_11),
	.B_o(SYNTHESIZED_WIRE_12),
	.bypassData_o(SYNTHESIZED_WIRE_5),
	.dataAddr_o(SYNTHESIZED_WIRE_20),
	.destination_o(SYNTHESIZED_WIRE_9),
	.jumpAddr_o(SYNTHESIZED_WIRE_2),
	.regfileWriteAddr_o(SYNTHESIZED_WIRE_17),
	.writeData_o(SYNTHESIZED_WIRE_21));


inst_rom	b2v_inst9(
	.pc_i(SYNTHESIZED_WIRE_41),
	.instr_o(SYNTHESIZED_WIRE_23));


endmodule
