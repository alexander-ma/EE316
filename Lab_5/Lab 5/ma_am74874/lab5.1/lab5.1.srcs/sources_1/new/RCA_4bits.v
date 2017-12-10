`timescale 1ns / 1ps

module RCA_4bits(
    input clk,
    input enable,
    input [3:0] A, B,
    input Cin,
    output [4:0] Q
    );
    wire ripple0, ripple1, ripple2, ripple3;
    
    //assign Cin = 1'b0;
    
    // Module instantiation for 4 bit RCA
    full_adder a0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(Q[0]), .Cout(ripple0));
    full_adder a1(.A(A[1]), .B(B[1]), .Cin(ripple0), .S(Q[1]), .Cout(ripple1));
    full_adder a2(.A(A[2]), .B(B[2]), .Cin(ripple1), .S(Q[2]), .Cout(ripple2));
    full_adder a3(.A(A[3]), .B(B[3]), .Cin(ripple2), .S(Q[3]), .Cout(Q[4]));
    
    // Module Instantiation for Register
    register_logic register(.clk(clk), .enable(enable), .Data(Q), .Q(Q));
    
endmodule