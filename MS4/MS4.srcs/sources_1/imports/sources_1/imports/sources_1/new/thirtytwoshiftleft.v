`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 03:00:31 PM
// Design Name: 
// Module Name: thirtytwoshiftleft
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


module thirtytwoshiftleft (input [31:0] in, output [31:0] out);
assign out= {in[30:0],1'b0};
endmodule
