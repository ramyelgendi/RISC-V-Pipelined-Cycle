`timescale 1ns / 1ps

module MUX_NEW1  ( input a , b , s , output reg out);
always @(*) 
begin 
 if (s==0)
 out = a;
 else 
 out =b; 
 end
endmodule
