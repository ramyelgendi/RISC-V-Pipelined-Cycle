`timescale 1ns / 1ps
module DFlipFlop #(parameter n = 32) (input clk, input rst, input load ,input[n-1:0] D, output reg[n-1:0] Q);
 always @ (posedge clk or posedge load or posedge rst)
 begin
 if (rst)
 begin 
 Q<=1'b0;
 end
 else //rst =0
 begin 
 if (load == 0 ) begin
 Q <= Q;
 end
  else begin
 Q <= D;
 end
 end
 end 
endmodule