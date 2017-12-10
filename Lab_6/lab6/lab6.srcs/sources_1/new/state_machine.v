`timescale 1ns / 1ps

module state_machine(
    input clk,
    output c
    );
    
    reg [1:0] state;
    reg [1:0] next;
    
    always @ (*) begin
        case(state)
            2'b00: next = 2'b01;
            2'b01: next = 2'b10;
            2'b10: next = 2'b11;
            2'b11: next = 2'b00;
        endcase
        end
        
    always @ (posedge clk) begin
        state <= next;
        end
        
    
    
    
endmodule
