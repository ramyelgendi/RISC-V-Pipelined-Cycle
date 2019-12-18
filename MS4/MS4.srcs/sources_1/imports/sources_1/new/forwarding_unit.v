`timescale 1ns / 1ps



module forwarding_unit(input [4:0] rs1, rs2, input memreg2,input [4:0] rd2, output reg out1, out2);
always @(*)
begin
if (rd2 == 0)
begin
out1 = 0;
out2 = 0;
end
else 
begin
if (memreg2)
begin 
if (rs1 == rd2)
out1= 1;
else
out1 = 0;
if (rs2 == rd2)
out2 =1;
else 
out2 = 0;
end
end
end
endmodule
