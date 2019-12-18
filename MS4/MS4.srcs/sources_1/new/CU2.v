`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2019 10:37:15 PM
// Design Name: 
// Module Name: CU2
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


module CU2(input [31:0] inst, input [31:0] jal, input [31:0] jalr, input [31:0] lui, input [31:0] auipc, input [31:0] mux, output reg [31:0] out);
wire [6:0] opcode;
//extract opcode
assign opcode[0] =inst[0]; 
assign opcode[1] =inst[1]; 
assign opcode[2] =inst[2]; 
assign opcode[3] =inst[3]; 
assign opcode[4] =inst[4]; 
assign opcode[5] =inst[5]; 
assign opcode[6] =inst[6];

always @(*) begin
case(opcode) 
7'b0110111: begin
out = lui;
end
7'b0010111: begin
out = auipc;
end
7'b1101111:begin
out = jal;
end
7'b1100111: begin
out = jalr;
end
default: begin
out = mux;
end
endcase
end
endmodule
