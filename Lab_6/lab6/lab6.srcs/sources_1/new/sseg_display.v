`timescale 1ns / 1ps

module time_mux_state_machine(
    input clk,
    input reset,
    input [6:0] in0,
    input [6:0] in1,
    input [6:0] in2,
    input [6:0] in3,
    output reg [3:0] an,
    output reg [6:0] sseg
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
    
    always @ (*) begin
        case(state)
            2'b00: sseg = in0;
            2'b01: sseg = in1;
            2'b10: sseg = in2;
            2'b11: sseg = in3;
        endcase
        
        case(state)
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
        endcase
    end
    
    always @ (posedge clk or posedge reset) begin
        if (reset)
            state <= 2'b00;
        else
            state <= next;
    end
    
        
endmodule


//module hexto7segment(
//    input [3:0] x,
//    output reg [6:0] r
//    );
        
//    always @(*)
//        case(x)
//            4'b0000: r = 7'b0000001;
//            4'b0001: r = 7'b1001111;
//            4'b0010: r = 7'b0010010;
//            4'b0011: r = 7'b0000110;
//            4'b0100: r = 7'b1001100;
//            4'b0101: r = 7'b0100100;
//            4'b0110: r = 7'b0100000;
//            4'b0111: r = 7'b0001111;
//            4'b1000: r = 7'b0000000;
//            4'b1001: r = 7'b0000100;
////            4'b1010: r = 7'b0001000;   // A
////            4'b1011: r = 7'b1100000;   // b
////            4'b1100: r = 7'b0110001;   // C
////            4'b1101: r = 7'b1000010;   // d
////            4'b1110: r = 7'b0110000;   // E
////            4'b1111: r = 7'b0111000;   // F
//        endcase
        
//endmodule
