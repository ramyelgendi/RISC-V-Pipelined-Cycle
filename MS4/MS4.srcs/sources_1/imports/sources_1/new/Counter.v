`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 03:38:38 PM
// Design Name: 
// Module Name: Counter
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
//Counter C1 (clk, rst, sclk);


module Counter(input clk, output reg sclk);
//reg counter = 0;
////assign sclk = 0;
//always @(*) begin
//if(counter == 2) begin
//sclk = 1;
//counter = 0;
//end
//else begin
//sclk = 0;
//counter = counter + 1;
//end
//end
reg temp;
initial temp =0;

always@(posedge clk)
begin
sclk =~temp;
temp = sclk;
end
//begin
//    if (rst == 1)
//        begin
//            sclk <= 0;
//            counter <= 0;
//        end
//    else
//        begin
//            counter <= counter + 1;
//            if (counter == 1)
//                begin
//                    counter <= 0;
//                    sclk <= ~sclk;
//                end
//        end
//end
endmodule
