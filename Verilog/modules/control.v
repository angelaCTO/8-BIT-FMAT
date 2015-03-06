`define ALU_ADD     4'b0000
`define ALU_SUB     4'b0001
`define ALU_AND     4'b0010
`define ALU_OR      4'b0011
`define ALU_NOT     4'b0100
`define ALU_LSHIFT  4'b0101
`define ALU_RSHIFT  4'b0110
`define ALU_LESS    4'b0111
`define ALU_EQUAL   4'b1000
`define ALU_GREATER 4'b1001

`define register0_ADDR    0
`define register1_ADDR    8
`define register2_ADDR   16
`define register3_ADDR   24
`define register4_ADDR   32
`define register5_ADDR   40
`define register6_ADDR   48
`define register7_ADDR   56
`define registerN_ADDR   64
`define registerCL_ADDR  68
`define registerCR_ADDR  72
`define registerR_ADDR   80
`define registerF_ADDR   88
`define registerJ0_ADDR  96
`define registerJ1_ADDR 104
`define registerJ2_ADDR 112
`define registerJ3_ADDR 120

module control(
	input [7:0] instr_i,
	input [7:0] register0_i,
	input [7:0] register1_i,
	input [7:0] register2_i,
	input [7:0] register3_i,
	input [7:0] register4_i,
	input [7:0] register5_i,
	input [7:0] register6_i,
	input [7:0] register7_i,
	input       registerN_i,
	input [3:0] registerR_i,
	input [1:0] registerF_i,
	input [3:0] registerCL_i,
	input [7:0] registerCR_i,
	input [7:0] registerJ0_i,
	input [7:0] registerJ1_i,
	input [7:0] registerJ2_i,
	input [7:0] registerJ3_i,
	input [7:0] registerO_i,

	output reg       halt_o,
	// 0 = bypass, 1 = ALU, 2 = DATA
	output reg [1:0] destination_o, 
	// if bypass
	output reg [7:0] bypassData_o,
	// if ALU
	output reg [7:0] A_o,
	output reg [7:0] B_o,
	output reg [3:0] aluOpcode_o,
	output reg       N_o,
	// if DATA
	output reg       writeEnable_o,
	output reg       readEnable_o,
	output reg [7:0] dataAddr_o,
	output reg [7:0] writeData_o,
	// Going to the regfile?
	output reg       regfileWriteEnable_o,
	output reg [3:0] regfileWriteAddr_o,
	output reg [7:0] jumpAddr_o,
	output reg       jumpAttempt_o
);

//reg [7:0] registers [11:0]; 
reg [7:0] registers [16:0]; 

initial begin
	destination_o = 0;
	A_o = 0;
	B_o = 0;
	aluOpcode_o = 0;
	N_o = 0;
	writeEnable_o = 0;
	readEnable_o = 0;
	dataAddr_o = 0;
	writeData_o = 0;
	regfileWriteEnable_o = 0;
	regfileWriteAddr_o = 0;
	jumpAddr_o = 0;
	jumpAttempt_o = 0;
	registers[0]   = register0_i;
	registers[1]   = register1_i;
	registers[2]   = register2_i;
	registers[3]   = register3_i;
	registers[4]   = register4_i;
	registers[5]   = register5_i;
	registers[6]   = register6_i;
	registers[7]   = register7_i;
	registers[8]   = registerN_i;
	registers[9]   = registerCL_i;
	registers[10]   = registerCR_i;
	registers[11]  = registerR_i;
	registers[12]  = registerF_i;
	registers[13]  = registerJ0_i;
	registers[14]  = registerJ1_i;
	registers[15]  = registerJ2_i;
	registers[16]  = registerJ3_i;

end

always @(*) begin 
	// N can always be set, we are only passing it along
	N_o = registerN_i;
	jumpAddr_o = registers[(3*4) + instr_i[3:2]];
	case (instr_i[7:4]) 
			// OTYPE INSTRUCTIONS
			4'b0000: begin
				case (instr_i[3:1]) 
					// NOP
					3'b000: begin 
					end 
					// HALT
					3'b001: begin 
						halt_o = 1;
					end
					// TBD
					3'b010: begin end
					// OVRFLW
					3'b011: begin 
						destination_o = 1;
						A_o = registers[registerR_i];
						B_o = registerO_i;
						aluOpcode_o = (instr_i[0]==1) ? `ALU_ADD : `ALU_SUB;
						regfileWriteEnable_o = 1;
						regfileWriteAddr_o = registerR_i;
					end
					// CLEAR
					3'b100: begin 
						destination_o = 0;
						regfileWriteEnable_o = 1;
						regfileWriteAddr_o = registerF_i*4;
						bypassData_o = (instr_i[0]==1) ? 8'b11111111 : 8'b00000000;
					end
					// NSET
					3'b101: begin 
						destination_o = 0;
						regfileWriteEnable_o = 1;
						regfileWriteAddr_o = `registerN_ADDR;
						bypassData_o = instr_i[0];
					end
					// RFRAME
					3'b110: begin 
						destination_o = 0;
						regfileWriteEnable_o = 1;
						regfileWriteAddr_o = `registerF_ADDR;
						bypassData_o = instr_i[0];
					end
					// SFRAME
					3'b111:begin 
						destination_o = 0;
						regfileWriteEnable_o = 1;
						regfileWriteAddr_o = `registerF_ADDR;
						bypassData_o = instr_i[0]+2;
					end
			endcase 
		end // End OTYPE
		// ADD
		4'b0001: begin 
			destination_o = 1;
			A_o = registers[(registerF_i*4)+instr_i[3:2]];
			B_o = registers[(registerF_i*4)+instr_i[1:0]];
			aluOpcode_o = `ALU_ADD;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = (registerF_i*4)+instr_i[3:2];
		end
		// SUB
		4'b0010: begin 
			destination_o = 1;
			A_o = registers[(registerF_i*4)+instr_i[3:2]];
			B_o = registers[(registerF_i*4)+instr_i[1:0]];
			aluOpcode_o = `ALU_SUB;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = (registerF_i*4)+instr_i[3:2];
		end
		// INCDEC
		4'b0011: begin 
			destination_o = 1;
			A_o = registers[instr_i[3:1]];
			B_o = 1;
			aluOpcode_o = (instr_i[0]) ? `ALU_ADD : `ALU_SUB ;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = instr_i[3:1];
		end
		// AND
		4'b0100: begin 
			destination_o = 1;
			A_o = registers[(registerF_i*4)+instr_i[3:2]];
			B_o = registers[(registerF_i*4)+instr_i[1:0]];
			aluOpcode_o = `ALU_AND;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = (registerF_i*4)+instr_i[3:2];
		end
		// OR
		4'b0101: begin 
			destination_o = 1;
			A_o = registers[(registerF_i*4)+instr_i[3:2]];
			B_o = registers[(registerF_i*4)+instr_i[1:0]];
			aluOpcode_o = `ALU_OR;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = (registerF_i*4)+instr_i[3:2];
		end
		// NOT
		4'b0110: begin 
			destination_o = 1;
			A_o = registers[instr_i[3:0]];
			aluOpcode_o = `ALU_NOT;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = instr_i[3:0];
		end
		// SEED
		4'b0111: begin 
			destination_o = 0;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = (instr_i[0]==1) ? `registerCL_ADDR : `registerCR_ADDR;
			bypassData_o = registers[instr_i[3:1]];
		end
		// MOVE
		4'b1000: begin 
			destination_o = 0;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = instr_i[3:2];
			bypassData_o = registers[instr_i[1:0]];
		end
		// LOAD
		4'b1001: begin 
			destination_o = 2;
			writeEnable_o = 0;
			readEnable_o = 1;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = instr_i[3:2];
			dataAddr_o = registers[instr_i[1:0]];
		end
		// STORE
		4'b1010: begin 
			destination_o = 2;
			writeEnable_o = 1;
			readEnable_o = 0;
			dataAddr_o = instr_i[1:0];
			writeData_o = registers[instr_i[3:2]];
		end
		// FOCUS
		4'b1011: begin 
			destination_o = 0;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = `registerR_ADDR;
			bypassData_o = instr_i[3:0];
		end
		// LOWER
		4'b1100: begin 
			destination_o = 0;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = registerR_i;
			//bypassData_o = (((registers[registerR_i])[7:4])<<4) + instr_i[3:0];
			bypassData_o = ((registers[registerR_i][7:4])<<4) + instr_i[3:0];
		end
		// UPPER
		4'b1101: begin 
			destination_o = 0;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = registerR_i;
			//bypassData_o = ((instr_i[3:0])<<4) + ((registers[registerR_i])[3:0]);
			bypassData_o = (instr_i[3:0]<<4) + (registers[registerR_i][3:0]);
		end
		// SHIFT
		4'b1110: begin 
			destination_o = 1;
			A_o = registers[registerR_i];
			B_o = instr_i[3:1];
			aluOpcode_o = (instr_i[0]==1) ? `ALU_RSHIFT : `ALU_LSHIFT;
			regfileWriteEnable_o = 1;
			regfileWriteAddr_o = registerR_i;
		end
		// JUMPIF
		4'b1111: begin 
			destination_o = 1;
			if (instr_i[1:0] == 0) begin
				A_o = registers[registerCL_i];
				B_o = registers[registerCR_i];
				aluOpcode_o = `ALU_EQUAL;
			end
			else if (instr_i[1:0] == 1) begin
				A_o = registers[registerCL_i];
				B_o = registers[registerCR_i];
				aluOpcode_o = `ALU_LESS;
			end
			else if (instr_i[1:0] == 2) begin
				A_o = registers[registerCL_i];
				B_o = registers[registerCR_i];
				aluOpcode_o = `ALU_GREATER;
			end
			// (Jump Always)
			else if (instr_i[1:0] == 3) begin
				A_o = 0;
				B_o = 0;
				aluOpcode_o = `ALU_EQUAL;
			end
			regfileWriteEnable_o = 0;
		end
	endcase
end

endmodule