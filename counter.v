`timescale 1ns / 1ps

module counter #(parameter N =8)
              (
              input clk,
              input rst,
              output reg [N-1:0] count
               );
               
    always@(posedge clk)
    begin
    if(rst == 0)
     begin
     count <= 0;
     end else
      begin
      count <= count + 1;
      end     
    end           
               
endmodule
