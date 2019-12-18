`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2019 11:46:37 AM
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test();
reg clk, rst;
integer i;
//wire [31:0]  PC_curr;
//wire RegWrite; 
//wire [31:0] writedata;
RISCV R1(clk,  rst);

    parameter PERIOD = 2;
 initial begin
      clk = 1'b0;
      rst = 1'b0;
      #(PERIOD/2);
      
       clk = 1'b1;
       rst = 1'b1;
      #(PERIOD/2);
      
       clk = 1'b1;
       rst = 1'b0;
       #(PERIOD/2);
       
               for (i=0; i<150; i=i+1)
         #(PERIOD/2) clk = ~clk;
     end 
endmodule
