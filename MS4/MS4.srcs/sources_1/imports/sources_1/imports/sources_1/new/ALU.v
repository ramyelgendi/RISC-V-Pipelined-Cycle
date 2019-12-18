`timescale 1ns / 1ps
module ALU # (parameter n = 32) (input[n-1:0]  a, b , input [4:0] sel , output reg  [n-1:0] ALUresult , output reg FinalFlag);
wire [31:0] results1, results2, results3, results4, op_b;
wire sf, vf, cf;
reg [63:0] temp;
assign results1= a&b ;
assign results2 = a|b;
assign {cf, add} = sel[0] ? (a + op_b + 1'b1) : (a + b);
Adder A1 (a,b, sel[3:0], results3);
assign results4 = results3;
assign sf = results3[31];
assign op_b = (~b);
assign vf = (a[31] ^ (op_b[31]) ^ results3[31] ^ cf);
always @(*)
 begin
    case(sel)
    5'b00000: ALUresult = results1; //and
    5'b00001: ALUresult = results2;  //or
    5'b00010: ALUresult = results3;  //add
    5'b00110: ALUresult = results4;  //sub
    5'b01111: ALUresult = $signed(a) >> b;   //sra &srai
    5'b01110: ALUresult = (a >> b); //srl &srli
    5'b01101: ALUresult = (a^b); //xor
    5'b01100: ALUresult = (a<b); //sltu
    5'b01011: ALUresult = $signed(a)<$signed(b); //slt & slti
    5'b01001: ALUresult = a << b; //sll & slli
    5'b01000: ALUresult = (sf == vf); //BGE
    5'b00111: ALUresult = (a >= b); //BGEU
    5'b00100: ALUresult = results4; //SH
    5'b00011: ALUresult = {a[31:12],12'b0}; //LUI
    5'b11111: ALUresult = (sf != vf); //BLT
    5'b11110: ALUresult = (a < b); //BLTU
    // ====== BONUS ========
    
    5'b10000: begin 
        temp = a*b;
        ALUresult = temp[31:0]; //MUL
    end
    5'b10001: begin
        temp = $signed(a)*$signed(b);
        ALUresult = temp[63:32]; //MULH
    end
    5'b10010: begin
        temp = $signed(a)*b;
        ALUresult = temp[63:32]; //MULHSU
    end
    5'b10011: begin
        temp = a*b;
        ALUresult = temp[63:32]; //MULHU
    end 
    5'b10100: ALUresult = $signed(a)/$signed(b); //DIV
    5'b10101: ALUresult = a/b; //DIVU
    5'b10110: ALUresult = $signed(a)%$signed(b); //REM
    5'b10111: ALUresult = a%b; //REMU

    // ====================

    endcase
end

always@(*)
    begin
    case(sel)
    5'b00110: begin //BEQ
         if(ALUresult == 0) begin
         FinalFlag = 1;
          #50;
                 FinalFlag = 0;
         end
         else begin
         FinalFlag = 0;
        
         end
    end
    5'b00100: begin //BNE
        if(ALUresult == 0) begin
        FinalFlag = 0;
          end
        else  begin
        FinalFlag = 1;
         end
    end
    5'b11111: begin
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
         FinalFlag = 1;

        end
    end
    5'b11110: begin //BLTU
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
         FinalFlag = 1;
    
        end
        end
    5'b01000: begin //BGE
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
      FinalFlag = 1;
      
        end
    end
        5'b00111: begin //BGEU
        if(ALUresult == 0)
        FinalFlag = 0;
        else begin
        FinalFlag = 1;

        end
    end
    endcase
    end
endmodule
