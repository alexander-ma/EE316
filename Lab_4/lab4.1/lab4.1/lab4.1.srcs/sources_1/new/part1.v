`timescale 1ns / 1ps

module part1(
    input wire clk,
    input wire call,
    input wire cancel,
    output reg light
    );
    
reg next;

// Combinational Block
always @(*) begin
    case ({call, cancel, light})
     3'b000 : next = 1'b0;
     3'b001 : next = 1'b1;
     3'b010 : next = 1'b0;
     3'b011 : next = 1'b0;
     3'b100 : next = 1'b1;
     3'b101 : next = 1'b1;
     3'b110 : next = 1'b1;
     3'b111 : next = 1'b1;
     default : next = 1'b0;
     endcase
//next = call | (!cancel)&light;
end
    
// Sequential block
always @ (posedge clk) begin
    light <= next;
end
    
    
endmodule
