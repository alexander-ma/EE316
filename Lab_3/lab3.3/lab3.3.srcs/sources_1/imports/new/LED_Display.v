`timescale 1ns / 1ps
/*
module LED_Display(
    input [3:0] in,
    output reg [7:0] out,
    output reg an0,
    output reg an1,
    output reg an2,
    output reg an3
    );
   
    
always @(*)
    begin
    an0 = 0;
    an1 = 1;
    an2 = 1;
    an3 = 1;
    case(in)
        4'b0000: out = 8'b10000001;
        4'b0001: out = 8'b11001111;
        4'b0010: out = 8'b10010010;
        4'b0011: out = 8'b10000110;
        4'b0100: out = 8'b11001100;
        4'b0101: out = 8'b10100100;
        4'b0110: out = 8'b10100000;
        4'b0111: out = 8'b10001111;
        4'b1000: out = 8'b10000000;
        4'b1001: out = 8'b10000100;
        default: out = 8'b11111111;
    endcase
    end
*/

//module LED_Display(
//    input [3:0] i,
//    output [6:0] o,
//    wire an0, an1, an2, an3
//    );

//    assign an0 = 1'b0;
//    assign an1 = 1'b1;
//    assign an2 = 1'b1;
//    assign an3 = 1'b1;
    
//    // Defining wires and gates
//    wire not_i0, not_i1, not_i2, not_i3;
    
//    not n0 (not_i0, i[0]);
//    not n1 (not_i1, i[1]);
//    not n2 (not_i2, i[2]);
//    not n3 (not_i3, i[3]);
    
//    wire a1, a2, a3, a4;
//    and (a1, i[0], i[1]);
//    and (a2, i[0], i[2]);
//    and (a3, i[2], not_i2, not_i3);
//    and (a4, not_i0, not_i1, not_i2, i[3]);
        
//    wire b1, b2;    
//    and (b1, i[1], not_i2, i[3]);
//    and (b2, i[1], i[2], not_i3);
        
//    wire c1;    
//    and (c1, not_i1, i[2], not_i3);
    
//    wire d1;    
//    and (d1, i[1], i[2], i[3]);
        
//    wire e1;    
//    and (e1, i[0], i[2], not_i3);
        
//    wire f1, f2, f3;
//    and (f1, i[2], i[3]);
//    and (f2, not_i1, i[2]);
//    and (f3, not_i0, not_i1, i[3]);
       
//    wire g1;
//    and (g1, not_i0, not_i1, not_i2);
        
//    or x0 (o[0], a1, a2, a3, a4);     // a
//    or x1 (o[1], a1, a2, b1, b2);     // b
//    or x2 (o[2], a1, a2, c1);         // c
//    or x3 (o[3], a1, a2, a3, d1);     // d
//    or x4 (o[4], d, a3, e1);          // e
//    or x5 (o[5], a1, f1, f2, f3);     // f
//    or x6 (o[6], a1, a2, g1, d1);     // g

//endmodule


    module LED_Display(
    input a,
    input b,
    input c,
    input d,
    output z0,
    output z1,
    output z2,
    output z3,
    output z4,
    output z5,
    output z6,
    wire an0, an1, an2, an3, dp
    );
    
    assign an0 = 1'b0;
    assign an1 = 1'b1;
    assign an2 = 1'b1;
    assign an3 = 1'b1;
    assign dp = 1'b1;
    
    // Defining wires and gates
    wire not_a, not_b, not_c, not_d;
    
    not n0 (not_a, a);
    not n1 (not_b, b);
    not n2 (not_c, c);
    not n3 (not_d, d);
    
    wire a1, a2, a3, a4;    
    and (a1, a, b);
    and (a2, a, c);
    and (a3, b, not_c, not_d);
    and (a4, not_a, not_b, not_c, d);
    
    wire b1, b2;    
    and (b1, b, not_c, d);
    and (b2, b, c, not_d);
    
    wire c1;    
    and (c1, not_b, c, not_d);
    
    wire d1, d2;    
    and (d1, b, c, d);
    and (d2, not_a, not_b, not_c, d);
    
    wire e1;    
    and (e1,a, c, not_d);
    
    wire f1, f2, f3;
    and (f1, c, d);
    and (f2, not_b, c);
    and (f3, not_a, not_b, d);
    
    wire g1;
    and (g1, not_a, not_b, not_c);
    
    or x0 (z0, a1, a2, a3, a4);     // a
    or x1 (z1, a1, a2, b1, b2);     // b
    or x2 (z2, a1, a2, c1);         // c
    or x3 (z3, a1, a2, a3, d1, d2);     // d <-- something's wrong here.
    or x4 (z4, d, a3, e1);          // e
    or x5 (z5, a1, f1, f2, f3);     // f
    or x6 (z6, a1, a2, g1, d1);     // g

    
endmodule

