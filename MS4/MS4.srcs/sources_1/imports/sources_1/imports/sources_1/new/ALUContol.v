`timescale 1ns / 1ps
module ALUControl( input [1:0] ALUop , input [2:0]inst , input inst2 ,new, input operation, output reg [4:0] ALUsel);
always @(*)
begin

    if (ALUop == 2'b00) begin//Load and store
      if(inst == 3'b000)
          ALUsel =5'b00010;
      if(inst == 3'b001)
          ALUsel = 5'b00100;
      if(inst == 3'b010)
          ALUsel = 5'b00010;
      if(inst == 3'b100)
          ALUsel = 5'b00010;
      if(inst == 3'b101)
          ALUsel = 5'b00010;
end

    else if (ALUop ==2'b11) //U-format
        ALUsel = 5'b00011; // LUI & AUIPC

    else if (ALUop == 2'b01)
    begin //SB-Format
    
    if(inst == 3'b000)  //BEQ
    ALUsel = 5'b00110;
    
    else if(inst == 3'b001) //BNE
      ALUsel =5'b00100;
    
    else if(inst == 3'b100) // BLT
    ALUsel = 5'b11111;
    
    else if(inst == 3'b101) //BGE
    ALUsel = 5'b01000;
    
    else if(inst == 3'b110) //BLTU
    ALUsel = 5'b11110;
    
    else if(inst == 3'b111)//BGEU
    ALUsel = 5'b00111;
    
    end
    
    // ====== BONUS ========
    
    else if (ALUop ==2'b10 && operation)  // BONUS (MUL/DIV)
    begin
        if (inst == 3'b000) // MUL
            ALUsel = 5'b10000;
        if (inst == 3'b001) // MULH
            ALUsel = 5'b10001;
            
        if (inst == 3'b010) // MULHSU
            ALUsel = 5'b10010;
        if (inst == 3'b011) // MULHU
            ALUsel = 5'b10011;
            
        if (inst == 3'b100) // DIV
            ALUsel = 5'b10100;
        if (inst == 3'b101) // DIVU
            ALUsel = 5'b10101;
            
        if (inst == 3'b110) // REM
             ALUsel = 5'b10110;
        if (inst == 3'b111) // REMU
             ALUsel = 5'b10111;
    end
    
    // ====================
    
    else if (ALUop ==2'b10 && !operation)  // R-Format & I-Format
    begin
    if (inst == 3'b000)
     begin
        if (inst2 == 0) // add
            ALUsel = 5'b00010;
        if (new) //addi
            ALUsel = 5'b00010;
        else if (inst2 ==1) //sub
            ALUsel = 5'b00110;
        
        
      end
    else if (inst == 3'b111 && inst2 == 0)  //and & andi
       begin
        ALUsel = 5'b00000;
       end
    else if (inst == 3'b110)  //or & ori
        ALUsel = 5'b00001;
    else if (inst == 3'b101)
       begin
        if (inst2==0 & operation)  // srl & srli
            ALUsel= 5'b01110;
        else //sra & srai
            ALUsel= 5'b01111;
       end
    else if (inst == 3'b100)   //xor  & xori
         ALUsel= 5'b01101;
    else if (inst == 3'b011)  //sltu  & sltui
         ALUsel= 5'b01100;
    else if (inst == 3'b010)  //slt   & slti
          ALUsel= 5'b01011;
    else if (inst == 3'b001)  //sll & slli
          ALUsel= 5'b01001;
    end

end
endmodule
