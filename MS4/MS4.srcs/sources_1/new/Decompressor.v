//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 11/20/2019 12:43:35 AM
//// Design Name: 
//// Module Name: Decompressor
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

//`timescale 1ns / 1ps


//module Decompresser(input [15:0] C_Inst, output reg [31:0] N_Inst);
//wire [1:0] opcode, inst1, inst2;;
//wire [2:0] func3;

//assign func3 = C_Inst[15:13];
//assign opcode = C_Inst[1:0];
//assign inst1 = C_Inst[11:10];
//assign inst2 =C_Inst[6:5];
//always @(*)
//begin
//case(opcode)
//    2'b00: // Lw & SW
//    begin //LW
//        if (func3 == 3'b010)
//        begin
//        N_Inst [6:0] = 7'b0000011;
//        N_Inst [11:7] = {2'b00, C_Inst [4:2]};
//        N_Inst [14:12] = func3;
//        N_Inst [19:15] = {2'b00, C_Inst [9:7]};
//        N_Inst [31:20] = {5'b00000,C_Inst[5],C_Inst[12:10],C_Inst[6],2'b00};
//        end
//        else
//         begin //SW
//         N_Inst [6:0] = 7'b0100011;
//         N_Inst [11:7] = {C_Inst[11:10],C_Inst[6],2'b00};
//         N_Inst [14:12] = 3'b010;
//         N_Inst [19:15] = {2'b00, C_Inst [9:7]};
//         N_Inst [24:20] = {2'b00, C_Inst [4:2]};
//         N_Inst [31:25] = {5'b00000,C_Inst [5],C_Inst [12], 2'b00};
//         end      
//    end
//    2'b01:
//begin
//         if (func3 == 3'b000)
//           begin //ADDI
//           N_Inst [6:0] = 7'b0010011;
//           N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//           N_Inst [14:12] = func3;
//           N_Inst [19:15] = {2'b00, C_Inst [9:7]};
//           N_Inst [31:20] = {{7{C_Inst[12]}},C_Inst[6:2]};
//           end  
//           else if (func3 == 3'b001)
//           begin //JAL
//           N_Inst [6:0] = 7'b1101111;
//           N_Inst [11:7]  = 5'b00001;
//           N_Inst [31:12] = {1'b0, C_Inst[12],C_Inst[8],C_Inst[10:9],C_Inst[6],C_Inst[7], C_Inst[2],C_Inst[11],C_Inst[5:3]};
//           end
//           else if (func3 == 3'b011)
//           begin //LUI
//           N_Inst [6:0] = 7'b0110111;
//           N_Inst [11:7]  = C_Inst[11:7];
//           N_Inst [31:12] = {{15{C_Inst[12]}},C_Inst[6:2]};
//           end
//            else if (func3 == 3'b100)
//            begin
//            case(inst1)
//                2'b00:
//                begin//SRLI
//                N_Inst [6:0] = 7'b0010011;
//                N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//                N_Inst [14:12] = 3'b101;
//                N_Inst [19:15] = {2'b00, C_Inst [9:7]};
//                N_Inst [24:20] = {C_Inst[12],C_Inst[6:2]};
//                N_Inst [31:25] = 7'b0000000;
//                end
//                2'b01:
//                begin //SRAI
//                N_Inst [6:0] = 7'b0010011;
//                N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//                N_Inst [14:12] = 3'b101;
//                N_Inst [19:15] = {2'b00, C_Inst [9:7]};
//                N_Inst [24:20] = {C_Inst[12],C_Inst[6:2]};
//                N_Inst [31:25] = 7'b0100000;
//                end
//                2'b10:
//                begin //ANDI
//                N_Inst [6:0] = 7'b0010011;
//                N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//                N_Inst [14:12] = 3'b111;
//     N_Inst [19:15]  = {2'b00, C_Inst [9:7]};
//                N_Inst [31:20] = {{7{C_Inst[12]}}, C_Inst[12],C_Inst[6:2]};
//                end
//    2'b11:
//begin
//case(inst2)
//2'b00:
//begin //SUB
//  N_Inst [6:0] = 7'b0110011;
//                N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//                N_Inst [14:12] = 3'b000;
//                N_Inst [24:20] = {2'b00,C_Inst[4:2]};
//N_Inst [31:25] = {7'b0100000};
//                  end
//2'b01:
//begin //XOR
//  N_Inst [6:0] = 7'b0110011;
//                N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//                N_Inst [14:12] = 3'b100;
//                N_Inst [24:20] = {2'b00,C_Inst[4:2]};
//N_Inst [31:25] = {7'b0000000};
//                  end
//2'b10:
//begin //OR
//  N_Inst [6:0] = 7'b0110011;
//                N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//                N_Inst [14:12] = 3'b110;
//                N_Inst [24:20] = {2'b00,C_Inst[4:2]};
//N_Inst [31:25] = {7'b0000000};
//                  end
//2'b11:
//begin //AND
//  N_Inst [6:0] = 7'b0110011;
//                N_Inst [11:7]  = {2'b00, C_Inst [9:7]};
//                N_Inst [14:12] = 3'b111;
//                N_Inst [24:20] = {2'b00,C_Inst [4:2]};
//N_Inst [31:25] = {7'b0000000};
//                  end
//    endcase
//end
//    endcase
//            end
//end
//2'b10:
//begin
//if (func3 == 3'b000)
//begin //SLLI
//N_Inst [6:0] = 7'b0010011;
//      N_Inst [11:7]  = C_Inst[11:7];
//      N_Inst [14:12] = 3'b001;
//      N_Inst [19:15] = C_Inst[11:7];
//      N_Inst [24:20] = {C_Inst[12],C_Inst[6:2]};
//      N_Inst [31:25] = 7'b0000000;
//end
//if (func3 ==3'b100)
//begin
//if (C_Inst[6:2] == 0)
//begin
//if (C_Inst[11:7] == 0)
//begin //EBREAK
//N_Inst[6:0] = 7'b1110011;
//N_Inst [31:7] = {{11{0}},1'b1,{13{0}}};
//end
//else
//begin//JALR
//N_Inst[6:0]= 7'b1100111;
//N_Inst[11:7] = 5'b00001;
//N_Inst [14:12] = 3'b000;
//N_Inst [31:15] = {{12{0}}, C_Inst[11:7]};
//end
//end
//else
//begin //ADD
//N_Inst [6:0]=7'b0110011;
//N_Inst[11:7]= {2'b00, C_Inst[9:7]};
//N_Inst[14:12] = 3'b000;
//N_Inst[19:15] = {2'b00, C_Inst[9:7]};
//N_Inst [24:20] = {2'b00,C_Inst[4:2]};
//N_Inst [31:25] = 7'b0000000;
//  end
//end
//end
//endcase
//end
//endmodule

