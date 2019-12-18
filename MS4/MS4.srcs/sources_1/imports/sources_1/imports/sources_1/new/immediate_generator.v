
//module rv32_ImmGen (
//    input  wire [31:0]  IR,
//    output reg  [31:0]  Imm
//);
//wire [2:0] r = IR[7:5];
//always @(*) begin
//	case (IR[7:5])
//		5'b01_100   : 	Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] };
//		 5'b01_000     :     Imm = { {21{IR[31]}}, IR[30:25], IR[11:8], IR[7] };
//		5'b01_101       :     Imm = { IR[31], IR[30:20], IR[19:12], 12'b0 };
//		5'b00_101     :     Imm = { IR[31], IR[30:20], IR[19:12], 12'b0 };
//		5'b11_011       : 	Imm = { {12{IR[31]}}, IR[19:12], IR[20], IR[30:25], IR[24:21], 1'b0 };
//		5'b11_001      : 	Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] };
//		5'b11_000    : 	Imm = { {20{IR[31]}}, IR[7], IR[30:25], IR[11:8], 1'b0};
//		default           : 	Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] }; // IMM_I
//	endcase 
//end

//endmodule
//`include "defines.v"
`timescale 1ns / 1ps

module immediate_generator(input [31:0] inst, output reg [31:0] immediate );
wire [6:0] opcode;
integer i;
wire [2:0] r = inst[7:5];
//extract opcode
assign opcode[0] =inst[0]; 
assign opcode[1] =inst[1]; 
assign opcode[2] =inst[2]; 
assign opcode[3] =inst[3]; 
assign opcode[4] =inst[4]; 
assign opcode[5] =inst[5]; 
assign opcode[6] =inst[6]; 

// immediate
always @(*)
begin 
case(opcode)
7'b0110011: //R
    begin
    //for (i=20 ; i<32 ; i=i+1)
    //begin
    immediate[0] = inst[20];
    immediate[1] = inst[21];
    immediate[2] = inst[22];
    immediate[3] = inst[23];
    immediate[4] = inst[24];
    immediate[5] = inst[25];
    immediate[6] = inst[26];
    immediate[7] = inst[27];
    immediate[8] = inst[28];
    immediate[9] = inst[29];
    immediate[10] = inst[30];
    immediate[11] = inst[31];
    
    //end
    end
7'b0100011: //store
begin
    //for (i=7 ; i<13 ; i=i+1)
    //    begin
        immediate[0] = inst[7];
        immediate[1] = inst[8];
        immediate[2] = inst[9];
        immediate[3] = inst[10];
        immediate[4] = inst[11];
        immediate[5] = inst[25];
        immediate[6] = inst[26];
        immediate[7] = inst[27];
        immediate[8] = inst[28];
        immediate[9] = inst[29];
        immediate[10] = inst[30];                          
        immediate[11] = inst[31];    
    //    end
    //    for (i=25 ; i<32 ; i=i+1)
    //    begin
    //    immediate[30-i] = inst[i];
    //    end
end
7'b0010011: //I-Format
    begin
        immediate[0] = inst[20];
        immediate[1] = inst[21];
        immediate[2] = inst[22];
        immediate[3] = inst[23];
        immediate[4] = inst[24];
        immediate[5] = inst[25];
        immediate[6] = inst[26];
        immediate[7] = inst[27];
        immediate[8] = inst[28];
        immediate[9] = inst[29];
        immediate[10] = inst[30];
        immediate[11] = inst[31];
    end
7'b0000011: //load
    begin
//        immediate[0] = inst[20];
//        immediate[1] = inst[21];
//        immediate[2] = inst[22];
//        immediate[3] = inst[23];
//        immediate[4] = inst[24];
//        immediate[5] = inst[25];
//        immediate[6] = inst[26];
//        immediate[7] = inst[27];
//        immediate[8] = inst[28];
//        immediate[9] = inst[29];
//        immediate[10] = inst[30];
//        immediate[11] = inst[31];
immediate = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] };
    end
7'b1100011: // branch
    begin 
        immediate[0] = 1'b0;
        immediate[1] = inst[8];
        immediate[2] = inst[9];
        immediate[3] = inst[10];
        immediate[4] = inst[11];
        immediate[5] = inst[25];
        immediate[6] = inst[26];
        immediate[7] = inst[27];
        immediate[8] = inst[28];
        immediate[9] = inst[29];
        immediate[10] = inst[30];
        immediate[11]=  inst[7];
        immediate[12] = inst[31];
    end
    //		5'b11_011       : 	Imm = { {12{IR[31]}}, IR[19:12], IR[20], IR[30:25], IR[24:21], 1'b0 };
    7'b1101111: //jal
begin 
    immediate[0] = 1'b0;
    immediate[1] = inst[21];
    immediate[2] = inst[22];
    immediate[3] = inst[23];
    immediate[4] = inst[24];
    immediate[5] = inst[25];
    immediate[6] = inst[26];
    immediate[7] = inst[27];
    immediate[8] = inst[28];
    immediate[9] = inst[29];
    immediate[10] = inst[30];
    immediate[11]=  inst[20];
    immediate[12] = inst[12];
    immediate[13] = inst[13];
    immediate[14] = inst[14];
    immediate[15]=  inst[15];
    immediate[16] = inst[16];
    immediate[17] = inst[17];
    immediate[18] = inst[18];
    immediate[19]=  inst[19];
    immediate[20] = inst[31];
end
7'b0110111:
    begin
    immediate = {inst[31], inst[30:20], inst[19:12], 12'b0}; //lui
    end
7'b0010111: begin
            immediate = {inst[31], inst[30:20], inst[19:12], 12'b0}; //auipc
            end
7'b1100111: begin
immediate= { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] };
end
endcase 
end
//// sign ext
//always @(*)
//begin 
//    if (opcode == 7'b1100011)
//        begin 
//            for (i=13 ; i<32 ; i=i+1)
//            begin 
//            immediate[i]=immediate[12];
//            end
//        end
//else if (opcode == 7'b1101111)
//begin
//for (i=21 ; i<32 ; i=i+1)
//        begin 
//        immediate[i]=immediate[20];
//        end
//end
//else
//    begin 
//        for (i=12 ; i<32 ; i=i+1)
//        begin 
//        immediate[i]=immediate[11];
//        end
//    end
//end
//module immediate_generator(input  wire [31:0]  IR,
//output reg  [31:0]  Imm
//);

//always @(*) begin
//case (`OPCODE)
//    `OPCODE_Arith_I   :     Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] };
//    `OPCODE_Store     :     Imm = { {21{IR[31]}}, IR[30:25], IR[11:8], IR[7] };
//    `OPCODE_LUI       :     Imm = { IR[31], IR[30:20], IR[19:12], 12'b0 };
//    `OPCODE_AUIPC     :     Imm = { IR[31], IR[30:20], IR[19:12], 12'b0 };
//    `OPCODE_JAL       :     Imm = { {12{IR[31]}}, IR[19:12], IR[20], IR[30:25], IR[24:21], 1'b0 };
//    `OPCODE_JALR      :     Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] };
//    `OPCODE_Branch    :     Imm = { {20{IR[31]}}, IR[7], IR[30:25], IR[11:8], 1'b0};
//    default           :     Imm = { {21{IR[31]}}, IR[30:25], IR[24:21], IR[20] }; // IMM_I
//endcase 
//end

endmodule
