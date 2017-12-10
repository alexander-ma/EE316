`timescale 1ns / 1ps

module time_multiplex_main(
    input clk,
    input reset,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] sseg
    );
    
    wire [6:0] in0, in1, in2, in3;
    wire slow_clk;
    
    // Module instantiation of hexto7segment decoder
    hexto7segment c1 (.x(sw[3:0]), .r(in0));
    hexto7segment c2 (.x(sw[7:4]), .r(in1));
    hexto7segment c3 (.x(sw[11:8]), .r(in2));
    hexto7segment c4 (.x(sw[15:12]), .r(in3));
    
    // Module instantiation of clock divider
    // same functionality as the clk_div before, but may have a different width requirement
    
    clk_div_disp c5 (.clk(clk), .reset(reset), .slow_clk(slow_clk));
    
    // Module instantiation of the multiplexer
    
    
    //replace slow_clk with clk for simulation, and vice versa
    time_mux_state_machine c6 (
        .clk(clk),
        .reset(reset),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .an(an),
        .sseg(sseg));
    
endmodule
