`timescale 1ns / 1ps

module Mux_structural(
    input [1:0] sel,
    input i0, i1, i2, i3,
    output d
    );

    wire [1:0] sel_b;
    not not0 (sel_b[0], sel[0]);
    not not1 (sel_b[1], sel[1]);
    wire n0, n1, n2, n3;
    and and0 (n0, i2, sel[1]);
    and and1 (n1, i0, sel_b[1]);
    and and2 (n2, i3, sel[1]);
    and and3 (n3, i1, sel_b[1]);

    wire x0, x1;

    nor nor0 (x0, n0, n1);
    nor nor1 (x1, n2, n3);

    wire y0, y1;
    or or0 (y0, x0, sel[0]);
    or or1 (y1, x1, sel_b[0]);
    nand nand0 (d, y0, y1);
    
endmodule
