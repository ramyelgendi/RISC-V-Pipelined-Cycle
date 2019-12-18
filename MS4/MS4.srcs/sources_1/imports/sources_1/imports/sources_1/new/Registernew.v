`timescale 1ns / 1ps
module Registernew #(parameter n = 32)( input clk , input rst , input [n-1:0] D , output [n-1:0] Q );
wire [n-1:0] Dff, Q1 ;

 genvar i ;
 generate  
 for (i =0 ; i<n ; i=i+1)
 begin 
 MUX_NEW1 M1( D[i] , Q1[i] ,rst, Dff[i]);
 DFlipFlop_NEW F1( clk, rst, Dff[i], Q[i]);
 assign Q1[i] = Q[i];
 end
endgenerate

endmodule
