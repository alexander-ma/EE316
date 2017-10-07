`timescale 1ns / 1ps

module tb_myAND;
    reg a;
    reg b;
    
    wire out;
    
    myAND and_gate0 (.a(a),.b(b),.out(out));
    
    initial
        begin
        
        a = 1'b0;
        b = 1'b0;
        
        #50;
        
        a = 1'b0;
        b = 1'b1;
        
        #50;
                
        a = 1'b1;
        b = 1'b0;
        
        #50;
        
        a = 1'b1;
        b = 1'b1;
        
        end
endmodule
