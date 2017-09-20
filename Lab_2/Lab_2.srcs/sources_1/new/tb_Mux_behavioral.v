`timescale 1ns / 1ps

module tb_Mux_behavioral;
    // Inputs te be define as registers
    reg [1:0] sel;
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    
    // Outputs to be defined as wires
    wire d;
    
    // Instantiate the Unit Under Test (UUT)
    Mux_behavioral uut (
        .sel(sel),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .d(d)
    );
    
    initial begin
        // Initialize inputs
        i0 = 1'b0;
        i1 = 1'b0;
        i2 = 1'b0;
        i3 = 1'b0;
        sel = 2'b0;
        
        #100;
        // Stimulus - All imput combinations followed by some wait time to observe the o/p
        sel = 0;
        #50
        i0 = 1'b1;
        #50;
        
        i0= 1'b0;
        sel = 1;
        #50;
        i1 = 1'b1;
        #50;
        
        i1 = 1'b0;
        sel = 2;
        #50;
        i2 = 1'b1;
        #50;
        
        i2 = 1'b0;
        sel = 3;
        #50;
        i3 = 1'b1;
        #50;
        i3 = 1'b0;
        
        end

endmodule