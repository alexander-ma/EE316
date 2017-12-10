`timescale 1ns / 1ps

module CLA_4bits(
    input clk,
    input enable,
    input [3:0] A, B,
    input Cin,
    output [4:0] Q
    );
    
    wire [3:0] G, P, S;
    wire [4:0] C;
    wire Cout;
    wire [4:0] Data;
    
    //assign Q = {Cout, S};
    
    // P = a ^ b
    // G = a&b
    // S = P ^ C
    // C = G + (P & G)
    
    assign P[0] = A[0] ^ B[0];
    assign P[1] = A[1] ^ B[1];
    assign P[2] = A[2] ^ B[2];
    assign P[3] = A[3] ^ B[3];
    
    assign G[0] = A[0] & B[0];
    assign G[1] = A[1] & B[1];
    assign G[2] = A[2] & B[2];
    assign G[3] = A[3] & B[3];
    
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0]&C[0]);
    assign C[2] = (P[1]&P[0]&C[0]) | (P[1]&G[0]) | G[1];
    assign C[3] = (P[2]&P[1]&P[0]&C[0]) | (P[2]&P[1]&G[0]) | (P[2]&G[1]) | G[2];
    assign C[4] = (P[3]&P[2]&P[1]&P[0]&C[0]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&G[1]) | (P[3]&G[2]) | G[3];
    assign Cout = C[4];
    
    assign S[0] = P[0] ^ C[0];
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];
    
    assign Data[4] = Cout;
    assign Data[3:0] = S;
    
    register_logic register(.clk(clk), .enable(enable), .Data(Data), .Q());

endmodule
