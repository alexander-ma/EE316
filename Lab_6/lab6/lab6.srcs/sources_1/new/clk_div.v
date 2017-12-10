`timescale 1ns / 1ps


//Clock divider for refreshing 7 segment display

module clk_div(
    input clk,
    input reset,
    output slow_clk
    );
    
    reg [16:0] COUNT;
    
    assign slow_clk = COUNT[16];
    
    always @(posedge clk)
    begin
    if (reset)
        COUNT = 0;
    else
        COUNT = COUNT + 1;
    end
    
endmodule
