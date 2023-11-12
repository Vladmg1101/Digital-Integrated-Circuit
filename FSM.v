`timescale 1ns / 1ps

module FSM(
        input rst,
        input clk,
        input in,
        output reg out 
           );
    
    localparam Q0 = 2'b00;
    localparam Q1 = 2'b01;
    localparam Q2 = 2'b10;
    localparam Q3 = 2'b11;
    
    reg [1:0] state, state_next;
    
           
    always@(posedge clk)
    begin
    if(rst == 1)
     begin
     state <= Q0;
     end
     else
      begin
      state <= state_next;
      end
    end
    
    
    
      always@(*)
      begin
       state_next = state;
        case(state)
        Q0:
        begin
         if(in == 1)
           begin
           state_next = Q1;
           out = 0;
           end
        end
        
        Q1:
        begin
         if(in == 1)
          begin
          state_next = Q3;
          out = 1;
          end
         if(in == 0)
          begin
          state_next = Q2;
          out = 1;
          end 
        end
        
        Q2:
        begin
        if(in == 1)
         begin
         state_next = Q1;
         out = 1;
         end
        if(in == 0)
         begin
         state_next = Q0;
         out = 1;
         end       
        end

        Q3:
        begin
         if(in == 0)
          begin
          state_next = Q2;
          out = 0;
          end
        end
        
       default: state_next = Q0; 
       endcase
      end       
           
endmodule
