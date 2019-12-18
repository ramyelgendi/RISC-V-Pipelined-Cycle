`timescale 1ns / 1ps
module Register #(parameter n =32)( input clk , input rst , en ,output [n-1:0] Q , input[n-1:0] Reginput);
 DFlipFlop F1( clk, rst , en, Reginput, Q); // call D flip flop with reg enable 
endmodule
