`timescale 1ns / 1ps

module MUXarr #(parameter n = 8)( input [n-1:0] a , input[n-1:0] b , input s , output  [n-1:0] out );
    genvar i;
    generate 
    for ( i=0 ; i<n ; i=i+1)
    begin 
    MUX_NEW1 M1 (a[i],b[i],s,out[i]);  
    end
    endgenerate
endmodule
