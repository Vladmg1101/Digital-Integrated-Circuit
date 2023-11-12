`timescale 1ns / 1ps

module TOP(
          input in,
          input clk,
          input rst,
          output comp_out
          );
          
   wire fall;
   wire [7:0] out;
   wire [7:0] count;
   
   FallingEdgeDetector Falling(
                               .in(in),
                               .clk(clk),
                               .rst(rst),
                               .out(fall)
                               );
                               
   TriungularCounter Triangular(
                                .clk(clk),
                                .rst(rst),
                                .in(fall),
                                .out(out) 
                                );
                                
   counter Counter0(
                    .clk(clk),
                    .rst(rst),
                    .count(count)
                    );
                    
   COMP COMP0(
              .in1(out),
              .in0(count),
              .out(comp_out)
              );                                                              
          
endmodule
