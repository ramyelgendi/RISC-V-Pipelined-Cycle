`timescale 1ns / 1ps
module MUX_4to1 (input [31:0] results1, results2, results3, results4, input [1:0] sel , output reg [31:0] out);
always @(*) 
begin 
case (sel)
4'b00: out = results1;
4'b01: out =results2;
4'b10: out =results3;
4'b11: out =results4;
endcase
 end
endmodule
