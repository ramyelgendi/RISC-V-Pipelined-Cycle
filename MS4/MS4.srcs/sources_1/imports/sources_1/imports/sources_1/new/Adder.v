`timescale 1ns / 1ps

module Adder ( input [31:0] A , input [31:0] B, input [3:0] sel, output [31:0] out );
wire [31:0] sum;
wire [32:0] carry;
wire sign;
wire [31:0] sumnew,  Btemp ;
reg [31:0] Bnew;
//comp C1 (B, Btemp);
//assign  sign = A[7]|B[7];
assign carry[0] = 0;
genvar i; 
always @(*)
begin
if (sel== 4'b0110 )
begin 
Bnew =  ~B;
Bnew = Bnew +1;
end
else 
Bnew = B;
end
generate
for (i =0 ; i<32 ; i=i+1)
begin 
FullAdder FA (A[i], Bnew[i], carry[i], out[i] , carry[i+1]);
end
endgenerate
//comp C3 ( sum, out);
//assign out = sum;
//always @(*)
//if (sel== 4'b0010)
//out = sum;
//else 
//out = sumnew;
endmodule
