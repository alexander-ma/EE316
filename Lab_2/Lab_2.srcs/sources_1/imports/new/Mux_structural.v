`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2017 02:03:24 PM
// Design Name: 
// Module Name: Mux_structural
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux_structural(
    input s0,
    input s1,
    input i0,
    input i1,
    input i2,
    input i3,
    output d
    );
    
        // Defining wires for not signals
    wire s0_not, s1_not;
    
    // Instantiating Not gates as per the schematic
    not n0 (s0_not, s0);
    not n1 (s1_not, s1);
    
    // Instantiating And gates as per the schematic
    and g0 (d, s0_not, s1_not, i0);
    and g1 (d, s0_not, s1, i1);
    and g2 (d, s0, s1_not, i2);
    and g3 (d, s0, s1, i3);
    or g4 (d, s0, s1, i0, i1, i2, i3);
    
    
    
endmodule
