`timescale 1ns / 1ps

module tb();

reg in, clk, rst;
wire out;

FSM DUT(
       .in(in),
       .clk(clk),
       .rst(rst),
       .out(out)
        );
        
    initial begin
    clk = 0;
    forever #5 clk = ~clk; 
    end
    
    initial begin
    rst = 0;
    in = 0;
    forever #10 in = ~in;
    end
   
    initial begin
    #200
    $stop();
    end    

endmodule
