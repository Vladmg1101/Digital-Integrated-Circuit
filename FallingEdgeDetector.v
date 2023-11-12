`timescale 1ns / 1ps


module FallingEdgeDetector(
                    input rst,
                    input in,
                    input clk,
                    output reg out
                           );
                           
         localparam Q0 = 2'b00;
         localparam Q1 = 2'b01;
         localparam Q2 = 2'b10;
         
         reg [1:0] state, state_next;
         
         always@(posedge clk)
         begin
         if(rst == 0)
          begin
          state <= Q0;
          end else
          state <= state_next;
         end
         
         always@(*)
         begin
         state_next = state;
          case(state)
           Q0:
           begin
           if(in == 0)
           state_next = Q1;
           end
           
           Q1:
           begin
           if(in == 0) state_next = Q2;             
           if(in == 1) state_next = Q0;  
           end
              
           Q2:
           begin
           if(in == 1)
           state_next = Q0;
           end 
           default: state_next = Q0; 
          endcase
         end
         
         always@(*)
          begin
           case(state)
            Q0: begin
              out = 0;
                end
                
            Q1: begin
              out = 1;
                end
                
            Q2: begin
               out = 0;
                end        
           endcase
          end                 
                           
                           
                           
endmodule
