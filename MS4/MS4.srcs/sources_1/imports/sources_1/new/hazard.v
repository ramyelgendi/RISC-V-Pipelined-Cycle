`timescale 1ns / 1ps

module hazard(input [4:0] rs1, rs2, rd, input sel, output reg out);
always @(*)
begin
if (sel == 0)
out = 0;
if (rd ==0)
out = 0;
else 
begin
if (sel)
begin
if((rs1 == rd) || (rs2 == rd))
out = 1;
end
end
end
endmodule
