`timescale 1ns / 1ps

module counter(
    input startstop, //start and stop button. Count only start when this button is pressed. Press again becomes stop. Resume back to count if pressed after stop
    input reset, //reset button 
    input slow_clk,  //input counter clock 
    output reg [3:0] d0, //count for right most digit
    output reg [3:0] d1, //count for 2nd right most digit
    output reg [3:0] d2, //count for 2nd left most digit
    output reg [3:0] d3  //count for left most digit
    );
    
    reg button;
//    reg startstop;
//    reg reset;
    
    
    endmodule