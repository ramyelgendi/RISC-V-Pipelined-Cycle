`timescale 1ns / 1ps

module RegisterFile#(parameter n = 32)
(input clk , input rst, input [4:0] read1 , read2 ,
input[n-1:0]  WriteData, input RegWrite, input [4:0]WriteReg,  
output [31:0] data1 , output   [31:0] data2);

//Inputs

wire [n-1:0] e;

wire[n-1:0] r0, r1 , r2 , r3 , r4 ,r5 ,r6 ,r7 , r8 , r9 ,r10; 
wire [n-1:0]r11 , r12 , r13 , r14 , r15 , r16 , r17 , r18 ;
wire[n-1:0] r19 ,r20 , r21 , r22 ,r23 ,r24 ,r25 ,r26 , r27 ;
wire [n-1:0]r28 ,r29 ,r30 , r31;
decode #(n)D1 (WriteReg, RegWrite, e);

assign r0 = 32'd0; 

//// Brute force creation of 32 registers
//Register #(n) R0(clk ,   rst,   e[0],   r0, WriteData);
Register #(n) R1(clk ,   rst,   e[1],  r1, WriteData);
Register #(n) R2(clk ,   rst,   e[2],   r2, WriteData);
Register #(n) R3(clk ,   rst,   e[3],   r3, WriteData);
Register #(n) R4(clk ,   rst,   e[4],   r4, WriteData);
Register #(n) R5(clk ,   rst,   e[5],  r5, WriteData);
Register #(n) R6(clk ,   rst,   e[6],  r6, WriteData);;
Register #(n) R7(clk ,   rst,   e[7],   r7, WriteData);
Register #(n) R8(clk ,   rst,   e[8],   r8, WriteData);
Register #(n) R9(clk ,   rst,   e[9],    r9, WriteData);
Register #(n) R10(clk ,  rst,  e[10], r10, WriteData);
Register #(n) R11(clk ,  rst,  e[11],  r11, WriteData);
Register #(n) R12(clk ,  rst , e[12],  r12, WriteData);
Register #(n) R13(clk ,  rst , e[13],  r13, WriteData);
Register #(n) R14(clk ,  rst , e[14],  r14, WriteData);
Register #(n) R15(clk ,  rst , e[15],  r15, WriteData);
Register #(n) R16(clk ,  rst , e[16],  r16, WriteData);
Register #(n) R17(clk ,  rst , e[17],  r17, WriteData);
Register #(n) R18(clk ,  rst , e[18],  r18, WriteData);
Register #(n) R19(clk ,  rst , e[19],  r19, WriteData);
Register #(n) R20(clk ,  rst , e[20],  r20, WriteData);
Register #(n) R21(clk ,  rst , e[21],  r21, WriteData);
Register #(n) R22(clk ,  rst , e[22],  r22, WriteData);
Register #(n) R23(clk ,  rst , e[23],  r23, WriteData);
Register #(n) R24(clk ,  rst , e[24],  r24, WriteData);
Register #(n) R25(clk ,  rst , e[25], r25, WriteData);
Register #(n) R26(clk ,  rst , e[26],  r26, WriteData);
Register #(n) R27(clk ,  rst,  e[27],  r27, WriteData);
Register #(n) R28(clk ,  rst,  e[28],  r28, WriteData);
Register #(n) R29(clk ,  rst , e[29],  r29, WriteData);
Register #(n) R30(clk ,  rst , e[30],  r30, WriteData);
Register #(n) R31(clk ,  rst , e[31],  r31, WriteData);                 




//2 32x1 MUXs to read data
 MUX #(n) m1 (r0, r1 , r2 ,r3 , r4 ,r5 ,r6 ,r7 , r8 , r9 ,r10 ,r11 , r12 , r13 , r14 , r15 , r16 , r17 , r18 , r19 ,r20 , r21 , r22 ,r23 ,r24 ,r25 ,r26 , r27 
 ,r28 ,r29 ,r30 , r31, read1 , data1);
 
 MUX #(n)m2 (r0, r1 , r2 ,r3 , r4 ,r5 ,r6 ,r7 , r8 , r9 ,r10 ,r11 , r12 , r13 , r14 , r15 , r16 , r17 , r18 , r19 ,r20 , r21 , r22 ,r23 ,r24 ,r25 ,r26 , r27 
 ,r28 ,r29 ,r30 , r31, read2, data2);
 endmodule
