`timescale 1ns / 1ps

module register_logic(
    input clk,
    input enable,
    input [4:0] Data,
    output reg [4:0] Q
    );
        
    //RCA_4bits rca(.clk(clk), .enable(enable), 
    
    always @ (posedge clk)
        if(enable)
            Q = Data;
endmodule
