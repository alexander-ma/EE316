`timescale 1ns / 1ps

module Mux_behavioral(
    input [1:0] sel,
    input i0, i1, i2, i3,
    output d
    );
    
    reg d;
    
    always @(*) 
      begin
        case (sel)
        default: d = 1'b0;
        0 : d = i0;
        1 : d = i1;
        2 : d = i2;
        3 : d = i3;
        endcase
      end


    
endmodule
