`timescale 1ns / 1ps

module RISCV(input clk1, input rst, clk, input [1:0] ledSel,input [3:0] ssdSel, output reg [15:0] outputPort , output  [3:0] Anode,  output [6:0] LED_out);
reg [12:0] LEDPort;
wire [31:0] PC_curr, PC_out, PC_outtemp,PC_curr1, MUXout,Shifted_J;
wire [31:0] Imem_out, Imem_out_new, Imem_out_new1;
wire [31:0] four;
wire [31:0] MUX1_out, Adder4_out, MUX1out, MUX2out, Adder77_out;
wire[31:0] MUX2_out, MUXJ_out, memory_out, Muxoutput ;
wire [31:0] data1, data2;
wire branch ,memRead, memToReg,memWrite, ALUsrc, RegWrite, jump, auipc, jal;
wire [1:0] ALUop ;
wire [31:0] immediate;
wire [4:0] ALU_control;
wire [31:0] ALUresult;
wire zeroFlag, flag;
wire [31:0] datamem_out; //not used
wire [31:0] Adder1_out , Adder2_out, Adder3_out, MUXoutt, JALOUT, JALROUT;
assign four = 32'd4;
wire [4:0] shamt;
wire sclk;
wire [31:0] addR;
wire andout, new,  stall, branching;
wire [12:0]  control_out,control_out1;
wire [63:0] Pipeline_out1;
wire [224:0] Pipeline_out2;
wire [241:0] Pipeline_out3;
wire [298:0] Pipeline_out4;
wire  out1,out2;
wire [31:0] OUT1_mux, OUT2_mux, test, test1;
//wire checkcomp;
//=========================================================
//Problems
//lui doesnt work 
//auipc doesnt shift right
//jal jumps sure bs it keeps jumping back so many times is that normal??
//==================================================================================================================================================================================
MUXarr #(32) MUX123 ( PC_out, PC_curr, flag, MUX2out); //ebreak
Addernew Add2 (PC_curr, four , Adder2_out); 
//Addernew Add2 (PC_curr, four , Adder2_out_temp);

//Addernew Add6 (PC_curr, 32'd2 , Adder2_out_temp1);

//MUXarr #(32) MUX132 (Adder2_out_temp,Adder2_out_temp1, checkcomp,Adder2_out);
Registernew #(32) PC1 (sclk , rst , MUX2out , PC_curr );

Counter C1 (clk, sclk);

//wire[32:0] addr = Pipeline_out3[105:74] +216; //msh el mafrood men[31:0]
wire[31:0] addr = Pipeline_out3[105:74] +216;

MUXarr #(32) MUX  (addr, PC_curr, sclk, Muxoutput);

Memory M1 (sclk, Pipeline_out3[8], Pipeline_out3[6],Muxoutput[7:0], Pipeline_out3[73:42], Pipeline_out3[109:107], memory_out);

//MUXarr #(32) MUX9 (memory_out, 32'b0,branching, Imem_out_new1);
//Decompresser D1(memory_out[15:0], C_Inst);

//MUXarr #(32)MUX21 (memory_out, C_Inst, checkcomp, Inst)

//Registernew #(64) Pipeline1 (~sclk , rst , {Inst,PC_curr} , Pipeline_out1 );
Registernew #(64) Pipeline1 (~sclk , rst , {memory_out,PC_curr} , Pipeline_out1 );

//=======================================================================================================================================================================================

CU Controlunit( Pipeline_out1[38:34],Pipeline_out1[63:32],ALUop, branch,memRead,memToReg,memWrite, ALUsrc, RegWrite,jump,auipc, new,jal,flag);
//RegisterFile Reg1(clk , rst, Imem_out[19:15] , Imem_out[24:20] ,MUXJ_out,  RegWrite,  Imem_out[11:7], data1 ,data2);
//RegisterFile Reg1(clk,rst,Pipeline_out1[51:47],Pipeline_out1[56:52], MUXJ_out,Pipeline_out4[4], Pipeline_out1[44:40] , data1 , data2);
RegisterFile Reg1(~sclk,rst,Pipeline_out1[51:47],Pipeline_out1[56:52], MUXJ_out,Pipeline_out4[70],Pipeline_out4[5:1], data1 ,data2);
//MUX1OUT or muxjout fel reg file
immediate_generator IM1(Pipeline_out1[63:32], immediate );

thirtytwoshiftleft shiftleft(immediate, addR); //not needed bs 2shta

MUXarr #(13) MUX6({ jump,auipc, new,jal,flag,ALUop , branch ,memRead , memToReg,memWrite, ALUsrc, RegWrite}, 13'b0, branching, control_out);

Registernew #(225) Pipeline2 (sclk ,rst, {Pipeline_out1[63:32],Pipeline_out1[57],addR,control_out[12:8],Pipeline_out1[56:47],immediate,data1,data2,control_out[7:0],Pipeline_out1[46:44],Pipeline_out1[61], Pipeline_out1[43:39], Pipeline_out1[31:0]} ,Pipeline_out2 );
wire [31:0] check = Pipeline_out2[144:113];
wire [31:0] check1 = Pipeline_out3[145:114];
wire [31:0] check2 = Pipeline_out4[137:106];
//=========================================================================================================================================================================================================

forwarding_unit F1 (Pipeline_out2[150:146], Pipeline_out2 [155:151],Pipeline_out4[70], Pipeline_out4[5:1], out1, out2 ); //check this shit!!!!!

//hazard H1 (Pipeline_out2[149:145], Pipeline_out2 [154:150], Pipeline_out3 [4:0], Pipeline_out2[45], stall);  //idk

MUXarr #(13) MUX7({Pipeline_out2[159:155],Pipeline_out2[48:41]}, 13'b0, branching, control_out1); 

MUXarr #(32) MUX2(Pipeline_out2[80:49], Pipeline_out2[144:113], Pipeline_out2[42], MUX2_out);

MUXarr #(32) MUX11(Pipeline_out2[112:81],MUX1_out, out1, OUT1_mux); 

MUXarr #(32) MUX12(MUX2_out, MUX1_out, out2, OUT2_mux);

//ALUControl control(Pipeline_out2[48:47] ,Pipeline_out2[40:38] ,Pipeline_out2[37] ,Pipeline_out2[157],  ALU_control);
ALUControl control(Pipeline_out2[48:47] ,Pipeline_out2[40:38] ,Pipeline_out2[37] ,Pipeline_out2[157] , Pipeline_out2[192], ALU_control);
ALU # (32) Main_ALU (OUT1_mux, OUT2_mux  , ALU_control, ALUresult , zeroFlag);

Addernew Add1 (Pipeline_out2[31:0], Pipeline_out2[191:160], Adder1_out); //addR

Registernew #(242) Pipeline3 (~sclk , rst , {Pipeline_out2[224:193],Pipeline_out2[191:160],OUT1_mux,Pipeline_out2[144:113],control_out1[12:11],control_out1[9:8],Pipeline_out2[40:38],zeroFlag, ALUresult,OUT2_mux,Adder1_out, control_out1[5:2], control_out1[0],Pipeline_out2[36:32]} , Pipeline_out3 );
//========================================================================= 
//bit 9 is branch
//assign branching = Pipeline_out3[106] & Pipeline_out3[9];
and(branching, Pipeline_out3[106], Pipeline_out3[9]);
//Pipeline_out3[145:114] immediate

MUXarr #(32) MUX3 (Adder2_out , Pipeline_out3[41:10], branching, MUXout); //branching

Addernew Add3 (PC_curr, Pipeline_out3[145:114], Adder3_out); //jal

Addernew Add5 (Pipeline_out3[177:146], Pipeline_out3[145:114] , Adder4_out); //jalr

MUXarr #(32) MUX5 (Adder3_out , Adder4_out,  Pipeline_out3[111], MUX1out); //picks between jal or jalr

MUXarr #(32) MUX__PC_out (MUXout , MUX1out,Pipeline_out3[113] ,PC_out); //jump
//propagate PC_curr :((
Addernew Add77 (Pipeline_out3[209:177],  PC_curr, Adder77_out); //auipc, and all dat



Registernew #(299) Pipeline4 (sclk , rst , {Adder4_out,Adder3_out,Pipeline_out3[241:210],Adder77_out,Pipeline_out3[110],PC_out, Pipeline_out3[145:114], branching,Pipeline_out3[113:112],Pipeline_out3[99:68],Pipeline_out3[5],memory_out,Pipeline_out3[105:74],Pipeline_out3[4:0], Pipeline_out3[7]} , Pipeline_out4);

//=========================================================================

assign test1 =Pipeline_out3[241:210]; 
assign test = Pipeline_out4[137:106]; //imm
MUXarr #(32) MUX1 (Pipeline_out4[37:6] , Pipeline_out4[69:38],Pipeline_out4[0] , MUX1_out ); //datamemmux
//MUXarr #(32) MUX111 (Pipeline_out4[137:106] , Pipeline_out4[201:169],Pipeline_out4[103] , MUXoutt ); // lui or auipc
//MUX_4to1 MUX_J_AIUPC (MUX1_out,Pipeline_out4[37:6],Pipeline_out4[137:106],32'b0,{Pipeline_out4[104],Pipeline_out4[103]} ,MUXJ_out);
Addernew Addeee (Pipeline_out4[266:235] , four, JALOUT); 
Addernew Addoooo (Pipeline_out4[298:267] , four, JALROUT); 
 //CU2(input [31:0] inst, input [31:0] jal, input [31:0] jalr, input [31:0] lui, input [31:0] auipc, input [31:0] mux, output reg [31:0] out);
CU2 pptw(Pipeline_out4[234:203], JALOUT, JALROUT, Pipeline_out4[137:106], Pipeline_out4[202:171], MUX1_out, MUXJ_out);

//===========================================================================

always @(*)
begin 
case(ledSel)
2'b00: outputPort<= Imem_out[15:0];
2'b01: outputPort <= Imem_out[31:16];
2'b10: 
    begin 
             outputPort[15] <= 0;
             outputPort[14] <= 0;
             outputPort [13] <= branch&zeroFlag;
             outputPort [12] <=memRead;
             outputPort [11] <= memToReg;
             outputPort[10] <= ALUop[1];
             outputPort[9] <=ALUop[0];
             outputPort[8] <=ALU_control[3];
             outputPort[7] <=ALU_control[2];
             outputPort[6] <=ALU_control[1];
             outputPort[5] <=ALU_control[0];
             outputPort [4] <=memWrite;
             outputPort [3] <=ALUsrc;
             outputPort [2] <=RegWrite;
             outputPort [1] <= zeroFlag;
             outputPort [0] <= branch; 
    end
endcase
case (ssdSel)
4'b0000: LEDPort <= PC_curr [12:0];
4'b0001: LEDPort <= Adder2_out[12:0];
4'b0010: LEDPort <= Adder1_out[12:0];
4'b0011: LEDPort <= PC_out[12:0];
4'b0100: LEDPort <= data1[12:0];
4'b0101: LEDPort <= data2[12:0];
4'b0110: LEDPort  <= MUX1_out[12:0];
4'b0111: LEDPort <=immediate[12:0];
4'b1000: LEDPort <=immediate<<1;
4'b1001: LEDPort <=MUX2_out[12:0];
4'b1010: LEDPort <=ALUresult[12:0];
4'b1011: LEDPort <=datamem_out[12:0];
default :LEDPort <=PC_curr[12:0];
endcase
end
Four_Digit_Seven_Segment_Driver Drive1( clk1, LEDPort ,Anode, LED_out);
endmodule 
