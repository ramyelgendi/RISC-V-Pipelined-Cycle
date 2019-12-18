`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2019 12:34:01 PM
// Design Name: 
// Module Name: nshiftreg
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


module nshiftreg #(parameter N=8) (input [N-1:0] in, output [N-1:0] out);

    genvar i;
    generate
    assign out[0] = 0;
    for (i=0;i<N-1;i=i+1) begin
    assign out[i+1] = in[i];
    end
    endgenerate
endmodule
