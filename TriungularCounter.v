`timescale 1ns / 1ps


module TriungularCounter(
                         input clk,
                         input rst,
                         input in,
                         output reg [7:0] out
                         );
                         
     localparam Q0 = 3'b000;
     localparam Q1 = 3'b001;
     localparam Q2 = 3'b010;
     localparam Q3 = 3'b011;
     localparam Q4 = 3'b100;
     localparam Q5 = 3'b101;
     
     reg [2:0] state, state_next;
                         
     always@(posedge clk)
     begin
      if(rst == 1)
       begin
        state <= Q0;
       end else
        begin
        state <= state_next;
        end
     end
     
       always@(*) 
       begin
       state_next = state;
        case(state)
        
        Q0:begin
        if(in == 1)
          state_next=Q1;
        end
        
        Q1:begin
        if(in == 1)
         state_next=Q2;
        end