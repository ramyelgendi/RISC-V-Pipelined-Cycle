`timescale 1ns / 1ps

module CU( input [4:0] inst , input [31:0]full, output reg [1:0] ALUop , output reg branch ,memRead , memToReg,memWrite, ALUsrc, RegWrite, jump, auipc,outnew, jal, flag);
always @(*)
begin
if (inst == 5'b01100) //R Format
    begin 
        branch =0;
        memRead =0;
        memToReg =0;
        ALUop =2'b10;
        memWrite =0;
        ALUsrc =0;
        RegWrite =1;
             flag = 0;
        jump = 0;
        auipc=0;
         jal = 0;
     
    end  
else if (inst == 5'b00000) //LOAD
    begin 
        branch =0;
        memRead =1;
        memToReg =1;
        ALUop =2'b00;
             flag = 0;
        memWrite =0;
        ALUsrc =1;
        RegWrite =1;
        jump = 0;
        auipc=0;
    
    end  
else if (inst == 5'b01000) //S-Format
    begin 
        branch =0;
        memRead =0;
        //memToReg =0; // X
        ALUop =2'b00;
        memWrite =1;
        ALUsrc =1;
             flag = 0;
        RegWrite =0;
        jump =0;
        auipc=0;
         jal = 0;
         
    end  
else if (inst == 5'b11000) //SB-Format
    begin 
        branch = 1;
        memRead = 0;
        ALUop =2'b01;
        memWrite =0;
             flag = 0;
        ALUsrc =0;
        RegWrite =0;
        jump = 0;
        auipc=0;
       
         jal = 0;
    end  
else if (inst == 5'b00100) //I-Format 
    begin 
        branch =0;
        memRead =0;
        memToReg =0;
        ALUop =2'b10;
        memWrite =0;
        ALUsrc =1;
        RegWrite =1;
        jump = 0;
        auipc=0;
        outnew =1;
         jal = 0;
              flag = 0;
      
    end
//else if(inst == 5'b01000)  //S-Format
//    begin
//        branch =0;
//        memRead =0;
//        memToReg =0;
//        ALUop =2'b10;
//        memWrite =0;
//        ALUsrc =1;
//        RegWrite =1;
//        jump = 0;
//auipc=0;
 //   end
else if (inst == 5'b01101) // U-Format [LUI] 
    begin 
        branch =0;
        //memRead =0; //X
        memToReg =0;
        ALUop =2'b11;
             flag = 0;
        memWrite =0;
        ALUsrc =1;
        RegWrite =1;
        jump = 0;
        auipc=0;
         jal = 0;
       
    end
else if (inst == 5'b00101) // U-Format [AUIPC] 
    begin 
        branch =0;
        //memRead =0; //X
        memToReg =0;
        ALUop =2'b11;
        memWrite =0;
        ALUsrc =1;
        RegWrite =1;
        jump = 0;
             flag = 0;
        auipc=1;
         jal = 0;
      
    end
else if (inst == 5'b11011) // J-Format [JAL] 
  begin 
      branch =0;
      memRead =0;
      memToReg =0;
      ALUop =2'b00;
      memWrite =0;
      ALUsrc =1;
      RegWrite =1;
      jump = 1;
      auipc=0;
           flag = 0;
      jal = 0;
   
  end
 else if (inst == 5'b11001) // J-Format [JALR] 
    begin 
        branch =0;
        memRead =0;
        memToReg =0;
        ALUop =2'b00;
        memWrite =0;
        ALUsrc =1;
        RegWrite =1;
        jump = 1;
        auipc=0;
         flag = 0;
        jal = 1;
    end 
     else if (inst == 5'b11100)  // Ecall and Ebreak 
       begin 
       if(full[20] == 0) begin
           branch =0;
           memRead =0;
           memToReg =0;
           ALUop =0;
           memWrite =0;
           ALUsrc =0;
           RegWrite =0;
           jump = 0;
           auipc=0;
           jal = 0;
           flag = 0;
           end

else if(full[20] == 1) begin
flag = 1;
end
       
          end
           
           
     
        else if (inst == 5'b00011)  // Fence
             begin 
            
                 branch =0;
                 memRead =0;
                 memToReg =0;
                 ALUop =0;
                 memWrite =0;
                 ALUsrc =0;
                 RegWrite =0;
                 jump = 0;
                 auipc=0;
                 jal = 0;
                 flag = 0;
                 end
           
end
endmodule
