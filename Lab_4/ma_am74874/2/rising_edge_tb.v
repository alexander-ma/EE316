`timescale 1ns / 1ps

module rising_edge_tb;

reg clk;
reg signal;
reg reset;

wire outedge;

rising_edge ul (
.clk(clk),
.signal(signal),
.reset(reset),
.outedge(outedge)
);

initial begin
    
    clk = 0;
    signal = 0;
    reset = 0;
    
    #10;
    
    signal = 1;
    reset = 0;
    
    #10;
    
    signal = 0;
    reset = 1;
    
    #10;
    
    signal = 1;
    reset = 1;
    
    #10;
    
    signal = 0;
    reset = 0;
    
    #10;
    
    signal = 1;
    reset = 0;
    
    #10
    
    reset = 1;
    
    #20;
    
    reset = 0;
    
    #20;
    
    signal = 0;
    reset = 1;
    
    #20;
    
    signal = 0;
    reset = 0;
    
end
always
    #5 clk = ~clk;

endmodule
