module DFlipFlop_NEW
 (input clk, input rst, input D, output reg Q);
 always @ (posedge clk or posedge rst)
 if (rst) begin
 Q <= 0;
 end else begin
 Q <= D;
 end
endmodule