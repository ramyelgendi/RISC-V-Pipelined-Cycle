`timescale 1ns / 1ps

module MUXarrnew #(parameter n = 8)( input [n-1:0] a , input[n-1:0] b , input [n-1:0] c,input [1:0] s , output  [n-1:0] out );
    genvar i;
    generate 
    for ( i=0 ; i<n ; i=i+1)
    begin 
    MUX_NEW2 M1 (a[i],b[i],c[i], s,out[i]);  
    end
    endgenerate
endmodule
