`timescale 1ns / 1ps


module COMP(
           input [7:0] in0,
           input [7:0] in1,
           output out
            );
            
    assign out = (in0 < in1)? 1:0;       
            
endmodule
